#
# The spec unit
#
# Copyright (C) 2013 Nikolay Nemshilov
#
class TOTES::Spec
  include TOTES::Asserts

  attr_accessor :subject, :___proc

  #
  # Constructor
  #
  def initialize(subject, context=nil, &block)
    @subject = subject
    @context = context
    @___proc = block
  end

  #
  # Sub-level description
  #
  # ```ruby
  # describe Subject do
  #   describe Subject.new do
  #     it "must do stuff"
  #   end
  # end
  # ```
  #
  def describe(subject, context=nil, &block)
    TOTES::Runner << self.class.new(subject, context, &block)
  end

  #
  # Context creator that doesn't change the subject
  #
  # ```ruby
  # describe some_subject do
  #   context "new context" do
  #     it "must do stuff" do
  #     end
  #   end
  # end
  # ```
  #
  def context(context, &block)
    describe @subject, context, &block
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
      self # for the chained `.only`, `.skip` calls
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

  #
  # Returns the name of the spec
  #
  def to_s
    (@context || @subject).to_s
  end

  def inspect
    "#<TOTES::Spec @subject=#{@subject.inspect} @context=#{@context.inspect}>"
  end
end
