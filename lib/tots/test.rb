#
# A single test case entity
#
class TOTS::Test
  attr_accessor :name, :options, :block

  def initialize(args)
    @block   = args.last.is_a?(Proc) ? args.pop : skip
    @options = args.size > 1 && args.last.is_a?(Hash) ? args.pop : {}
    @name    = args[0] || 'no name given'
  end

  def skip
    @block = Proc.new do
      raise TOTS::Skip
    end
  end

  def run(context)
    test = self

    context.instance_eval do
      @options = test.options
      instance_eval &test.block
    end
  end

  class ::TOTS::Skip < Exception; end
end
