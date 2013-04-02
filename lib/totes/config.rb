#
# The config thingy
#
class TOTES::Config
  def self.current(config=nil)
    @current ||= config || TOTES::Config.new
  end

  def self.method_missing(name, *args, &block)
    if current.respond_to?(name)
      current.__send__(name, *args, &block)
    else
      super
    end
  end

  def initialize(args = {})
    self.class.current(self)
  end

  def reporter
    @reporter ||= TOTES::Reporter::Dots.new
  end

end
