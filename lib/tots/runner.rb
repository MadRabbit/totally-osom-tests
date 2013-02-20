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

        test = suite.new
        test.public_methods.each do |name|
          if name.slice(0, 4) == 'test'

            printer.running name

            begin
              test.__send__(name)
              printer.passed

            rescue TOTS::Fail => e
              printer.failed e
            end
          end
        end
      end

      printer.finish
    }
  end

end
