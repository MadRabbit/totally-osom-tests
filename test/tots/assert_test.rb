require 'test_helper'

describe TOTS::Spec do

  describe "standard assertions" do
    describe "assert" do
      it "must pass with trues" do
        assert true
      end

      it "must fail with false" do
        assert_raises(TOTS::Fail) { assert(false) }
      end
    end

    describe "assert_equal" do
      it "must pass with equal data" do
        assert_equal 2, 2
      end

      it "must fail with different data" do
        assert_raises(TOTS::Fail) { assert_equal(1,2) }
      end
    end

    describe "assert_raises" do
      it "must pass when something raised" do
        assert_raises(Exception) { raise Exception }
      end

      it "must fail when nothing raised" do
        assert_raises TOTS::Fail do
          assert_raises(Exception) { }
        end
      end

      it "must fail when raised a different type of exception" do
        assert_raises TOTS::Fail do
          assert_raises(TOTS::Fail) { raise Exception }
        end
      end
    end
  end

end
