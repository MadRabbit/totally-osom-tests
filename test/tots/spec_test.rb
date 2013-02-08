require 'test_helper'

describe TOTS::Spec do
  it "must be a subclass of Test::Unit::TestCase" do
    assert TOTS::Spec < MiniTest::Unit::TestCase
  end
end
