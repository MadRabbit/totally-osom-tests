#
# The spec unit
#
# Copyright (C) 2013 Nikolay Nemshilov
#
require 'test/unit'

class TOTS::Spec < Test::Unit::TestCase

  class << self
    def it(desc=nil, &block)
      define_method "test #{desc}", &block
    end
  end

end

#
# the top-level describe
#
module Kernel
  def describe(*args, &block)
    Class.new TOTS::Spec, &block
  end
end
