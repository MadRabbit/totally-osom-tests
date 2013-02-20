#
# The `must` thingy
#
class TOTS::Matcher
  def initialize(object, *args)
    @object = object
  end
end

class Object
  def must(*args)
    TOTS::Matcher.new(self)
  end
end
