#
# The runner
#
module TOTES::Runner
  class << self
    def <<(item)
      if item.is_a?(TOTES::Spec)
        specs[context] ||= []
        specs[context] << item
      elsif item.is_a?(TOTES::Test)
        tests[context] ||= []
        tests[context] << item
      end
    end

    def context
      @context
    end

    def context=(context)
      @context = context
    end

    def specs
      @specs ||= {}
    end

    def tests
      @tests ||= {}
    end

    def stack(spec)
      specs.each do |parent, children|
        children.each do |child|
          if child === spec
            return stack(parent) + [spec]
          end
        end
      end

      return [] # fallback
    end

    def start
      run(specs[nil])

      TOTES::Reporter.finish

      TOTES::Watcher.check
    end

    def run(specs)
      prepare(specs)

      tests.each do |spec, tests|
        TOTES::Reporter.testing spec

        tests.each do |test|
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
      end
    end

    def prepare(specs)
      specs.each do |spec|
        @context = spec

        spec.instance_eval &spec.___proc

        prepare(self.specs[spec] || [])
      end
    end
  end
end
