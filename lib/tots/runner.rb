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
    at_exit {
      printer = Printer::Dots.new

      tests.each do |suite|
        printer.testing suite

        caze = suite.new
        suite.tests.each do |test|
          printer.running test[:name]

          begin
            caze.run(test)

            printer.passed

          rescue TOTS::Fail => e
            printer.failed e
          end
        end
      end

      printer.finish
    }
  end

end
