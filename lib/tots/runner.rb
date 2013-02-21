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

  def self.start
    printer = Printer::Dots.new

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

    if !paths && @paths
      puts "\nWatching\n"
    end

    if !paths && @paths && !@watching
      @watching = true

      require 'rb-fsevent'

      runner  = self

      fsevent = FSEvent.new
      fsevent.watch Dir.pwd do |directories|
        puts "Detected change inside: #{directories.inspect}"

        runner.start
      end
      fsevent.run
    end

  end
end
