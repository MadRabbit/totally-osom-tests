require 'test_helper'

describe TOTES::Spec do

  it.skip "must be skipped" do
    assert false, "this block should not be called"
  end

  it "must allow to specify options", some: 'options' do
    assert_equal @test_options, some: 'options'
  end

  context "sub-block" do
    it "must be called too" do
      assert true
    end
  end
end
