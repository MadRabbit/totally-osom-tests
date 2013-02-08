#
# The spec unit
#
# Copyright (C) 2013 Nikolay Nemshilov
#
require 'test/unit'

class TOTS::Spec < Test::Unit::TestCase

  def initialize(*args)
  end

end

#
# the top-level define
#
module Kernel

  def describe(*args)
    TOTS::Spec.new(*args)
  end

end
