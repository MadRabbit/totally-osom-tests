#
# The spec unit
#
# Copyright (C) 2013 Nikolay Nemshilov
#
require 'test/unit'

class TOTS::Spec < Test::Unit::TestCase

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
  def self.it(*args, &block)
    if args.size == 0
      self
    else
      options = args.size > 1 && args.last.is_a?(Hash) ? args.last : {}

      define_method "test #{args[0]}" do
        @options = options

        instance_eval &block
      end
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
  def self.skip(*args, &block)
    define_method "test #{args[0]}" do
      skip
    end
  end

  #
  # The extra options access
  #
  # ```ruby
  # describe Somthing do
  #   it "something", some: 'options' do
  #     assert_equal options, some: 'options'
  #   end
  # end
  # ```
  #
  def options
    @options || {}
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
