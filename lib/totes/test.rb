#
# A single test case entity
#
class TOTES::Test
  attr_accessor :name, :options, :block

  class Skip < Exception; end
  class Fail < Exception; end

  def initialize(args)
    @block   = args.last.is_a?(Proc) ? args.pop : skip
    @options = args.size > 1 && args.last.is_a?(Hash) ? args.pop : {}
    @name    = args[0] || 'no name given'
  end

  def skip
    @block = Proc.new do
      raise Skip
    end
  end

  def proc
    opts = @options
    proc = @block

    Proc.new do
      @test_options = opts
      instance_eval &proc
    end
  end

  def to_s
    @name
  end

end
