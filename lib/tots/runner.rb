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
      tests.each do |desc|
        test = desc.new
        test.public_methods.each do |name|
          if name.slice(0, 4) == 'test'
            test.__send__(name)
          end
        end
      end
    }
  end

end
