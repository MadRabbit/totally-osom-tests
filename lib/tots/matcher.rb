#
# The `must` thingy
#
class TOTS::Matcher
  def initialize(*args)
  end
end

class Object
  def must(*args)
    TOTS::Matcher.new(self)
  end
end
