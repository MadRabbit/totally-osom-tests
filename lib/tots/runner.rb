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
    tests.each do |suite|
      TOTS::Printer.testing suite

      caze = suite.new
      suite.tests.each do |test|
        TOTS::Printer.running test.name

        begin
          caze.run(test)

          TOTS::Printer.passed

        rescue TOTS::Fail => e
          TOTS::Printer.failed e
        end
      end
    end

    TOTS::Printer.finish

    TOTS::Watcher.check
  end
end
