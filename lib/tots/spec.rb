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

  def self.specs
    @specs ||= []
  end

  #
  # Sub-describe blocks catcher
  #
  def self.describe(*args, &block)
    specs << Class.new(TOTS::Spec, &block)
  end

  #
  # alias for `describe`
  #
  def self.context(*args, &block)
    describe(*args, &block)
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
  # Runs the spec
  #
  def self.run
    TOTS::Printer.testing self

    suite = new

    tests.each do |test|
      TOTS::Printer.running test.name

      begin
        test.run(suite)

        TOTS::Printer.passed

      rescue TOTS::Test::Skip => e
        TOTS::Printer.skipped

      rescue TOTS::Test::Fail => e
        TOTS::Printer.failed(e)
      end
    end

    specs.each(&:run)
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
