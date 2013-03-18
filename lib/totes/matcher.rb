#
# The `must` thingy
#
class TOTES::Matcher
  include TOTES::Asserts

  def initialize(object, *args)
    @object = object
  end
end

class Object
  def must(*args)
    TOTES::Matcher.new(self)
  end
end
