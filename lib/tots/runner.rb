#
# The runner
#
class TOTS::Runner

  def self.<<(spec)
    specs << spec
  end

  def self.specs
    @specs ||= []
  end

  def self.start
    run(specs)

    TOTS::Reporter.finish

    TOTS::Watcher.check
  end

  def self.run(specs)
    specs.each do |spec|
      TOTS::Reporter.testing spec

      suite = spec.new

      spec.tests.each do |test|
        TOTS::Reporter.running test.name

        begin
          test.run(suite)

          TOTS::Reporter.passed

        rescue TOTS::Test::Skip => e
          TOTS::Reporter.skipped

        rescue TOTS::Test::Fail => e
          TOTS::Reporter.failed(e)
        end
      end

      run(spec.specs)
    end
  end
end
