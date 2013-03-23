require 'test_helper'

describe TOTES::Spec do

  it "must set the @subject" do
    @subject.must == TOTES::Spec
  end

  it "must set @context nil when it's not set" do
    @context.must == nil
  end

  describe "new subject" do
    it "must set the new subject" do
      @subject.must == "new subject"
    end

    describe "newer subject" do
      it "must change the subject again" do
        @subject.must == "newer subject"
      end
    end
  end

  context "context block" do
    it "must not change the subject" do
      @subject.must == TOTES::Spec
    end

    it "must change the context" do
      @context.must == "context block"
    end

    describe "new subject" do
      it "must reset the context" do
        @context.must == nil
      end
    end

    describe "new subject", "new context" do
      it "must set new context" do
        @context.must == 'new context'
      end
    end
  end

  context "with reassigned subject" do
    @subject = 'changed subject'

    it "must change the subject" do
      @subject.must == 'changed subject'
    end
  end

  it.skip "must be skipped" do
    assert false, "this block should not be called"
  end

  it "must allow to specify options", some: 'options' do
    assert_equal @test_options, some: 'options'
  end
end
