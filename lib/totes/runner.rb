#
# The runner
#
class TOTES::Runner

  def self.<<(item)
    if item.is_a?(TOTES::Spec)
      specs[context] ||= []
      specs[context] << item
    elsif item.is_a?(TOTES::Test)
      tests[context] ||= []
      tests[context] << item
    end
  end

  def self.context
    @context
  end

  def self.context=(context)
    @context = context
  end

  def self.specs
    @specs ||= {}
  end

  def self.tests
    @tests ||= {}
  end

  def self.start
    run(specs[nil])

    TOTES::Reporter.finish

    TOTES::Watcher.check
  end

  def self.run(specs)
    specs.each do |spec|
      self.context = spec

      TOTES::Reporter.testing spec

      spec.instance_eval &spec.___proc

      (tests[spec] || []).each do |test|
        TOTES::Reporter.running test

        begin
          spec.instance_eval &test.proc

          TOTES::Reporter.passed

        rescue TOTES::Test::Skip => e
          TOTES::Reporter.skipped

        rescue TOTES::Test::Fail => e
          TOTES::Reporter.failed(e)
        end

      end

      run(self.specs[spec] || [])
    end
  end

end
