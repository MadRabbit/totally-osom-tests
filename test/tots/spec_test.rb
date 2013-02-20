require 'test_helper'

describe TOTS::Spec do
  it "must be a subclass of Test::Unit::TestCase" do
    assert TOTS::Spec < MiniTest::Unit::TestCase
  end

  it.skip "must be skipped" do
    throw "Oh, it didn't work..."
  end

  it "must allow to specify options", some: 'options' do
    assert_equal options, some: 'options'
  end
end
