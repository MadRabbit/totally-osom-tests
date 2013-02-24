#
# The spec unit
#
# Copyright (C) 2013 Nikolay Nemshilov
#
class TOTS::Spec
  include TOTS::Asserts

  # the tests stash
  def self.tests
    @tests ||= []
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
  def self.it(*args,&block)
    if args.size == 0
      self
    else
      tests << TOTS::Test.new(args + [block])
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
    it *args # skipping the block
  end

  #
  # Runs the test (called from the runner)
  #
  def run(test)
    test.run(self)
  end

end

#
# the top-level describe
#
module Kernel
  def describe(*args, &block)
    TOTS::Runner << Class.new(TOTS::Spec, &block)
  end
end
