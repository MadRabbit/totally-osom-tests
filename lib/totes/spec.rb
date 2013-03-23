#
# The spec unit
#
# Copyright (C) 2013 Nikolay Nemshilov
#
class TOTES::Spec
  include TOTES::Asserts

  attr_accessor :subject, :parent, :block

  #
  # Constructor
  #
  def initialize(subject, &block)
    @subject = subject
    @block   = block
  end

  #
  # Sub-describe blocks catcher
  #
  def describe(subject, &block)
    TOTES::Runner << self.class.new(subject, &block)
  end

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
  def it(*args,&block)
    if args.size == 0
      self # for the future `.only`, `.skip`
    else
      TOTES::Runner << TOTES::Test.new(args + [block])
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
    it *args # skipping the block
  end

  def to_s
    @subject.to_s
  end
end
