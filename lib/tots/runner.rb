#
# The runner
#
class TOTS::Runner

  def self.<<(test)
    tests << test
  end

  def self.tests
    @tests ||= []
  end

  def self.printer
    @printer ||= Printer::Dots.new
  end

  def self.start
    tests.each do |suite|
      printer.testing suite

      caze = suite.new
      suite.tests.each do |test|
        printer.running test.name

        begin
          caze.run(test)

          printer.passed

        rescue TOTS::Fail => e
          printer.failed e
        end
      end
    end

    printer.finish

    watch
  end

  def self.watch(paths=nil)
    @paths = paths if paths

    printer.watching(true) if !paths && @paths

    if !paths && @paths && !@watching
      @watching = true

      require 'rb-fsevent'

      fsevent = FSEvent.new
      fsevent.watch Dir.pwd do |directories|
        TOTS::Runner.printer.watching(false)

        puts "Detected change inside: #{directories.inspect}\n"

        TOTS::Runner.start
      end
      fsevent.run
    end
  end
end
