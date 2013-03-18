#
# The runner
#
class TOTES::Runner

  def self.<<(spec)
    specs << spec
  end

  def self.specs
    @specs ||= []
  end

  def self.start
    run(specs)

    TOTES::Reporter.finish

    TOTES::Watcher.check
  end

  def self.run(specs)
    specs.each do |spec|
      TOTES::Reporter.testing spec

      suite = spec.new

      spec.tests.each do |test|
        TOTES::Reporter.running test.name

        begin
          test.run(suite)

          TOTES::Reporter.passed

        rescue TOTES::Test::Skip => e
          TOTES::Reporter.skipped

        rescue TOTES::Test::Fail => e
          TOTES::Reporter.failed(e)
        end
      end

      run(spec.specs)
    end
  end
end
