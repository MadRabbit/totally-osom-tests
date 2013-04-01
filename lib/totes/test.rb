#
# A single test case entity
#
class TOTES::Test
  attr_accessor :name, :options, :block, :marked

  class Skip < Exception; end
  class Fail < Exception; end

  def initialize(args)
    @block   = args.last.is_a?(Proc) ? args.pop : Proc.new{ raise Skip }
    @options = args.size > 1 && args.last.is_a?(Hash) ? args.pop : {}
    @name    = args[0] || 'no name given'
  end

  def skip(*args, &block)
    initialize(args)
  end

  def only(*args, &block)
    initialize(args + [block])
    @marked = true
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
