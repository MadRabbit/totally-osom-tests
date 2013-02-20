require 'test_helper'

describe TOTS::Spec do
  def skip # replacing the current skip
    @__skip_called
  end

  it.skip "must be skipped" do
    assert @__skip_called
  end

  it "must allow to specify options", some: 'options' do
    assert_equal options, some: 'options'
  end
end
