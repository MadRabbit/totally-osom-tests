#
# The spec unit
#
# Copyright (C) 2013 Nikolay Nemshilov
#
require 'test/unit'

class TOTS::Spec < Test::Unit::TestCase

  class << self
    #
    # The basic `it` thingy
    #
    # ```ruby
    # describe Smth do
    #   it "must do stuff" do
    #   end
    # end
    # ```
    #
    def it(*args, &block)
      if args.size == 0
        self
      else
        define_method "test #{args[0]}", &block
      end
    end

    #
    # Quick, skip marking
    #
    # ```ruby
    # describe Smth do
    #   it.skip "this test" do
    #     this_code.will_be(:skipped)
    #   end
    # end
    # ```
    #
    def skip(*args, &block)
      define_method "test #{args[0]}" do
        skip
      end
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
