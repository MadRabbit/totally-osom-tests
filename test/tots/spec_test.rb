require 'test_helper'

describe TOTS::Spec do

  it.skip "must be skipped" do
    assert false, "this block should not be called"
  end

  it "must allow to specify options", some: 'options' do
    assert_equal options, some: 'options'
  end
end
