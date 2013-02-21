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

    describe "assert_empty" do
      it "must pass correctly" do
        assert_empty ''
      end

      it "must fail with a non-empty objects" do
        assert_raises(TOTS::Fail) { assert_empty(' ') }
      end

      it "must fail with objects without the :empty? method" do
        assert_raises(TOTS::Fail) { assert_empty(nil) }
      end
    end

    describe "assert_respond_to" do
      it "must pass correctly" do
        assert_respond_to '', :size
      end

      it "must fail when method is missing" do
        assert_raises(TOTS::Fail) { assert_respond_to('', :non_existing_method) }
      end
    end

    describe "assert_nil" do
      it "must pass correctly" do
        assert_nil nil
      end

      it "must fail with non nils" do
        assert_raises(TOTS::Fail) { assert_nil(false) }
        assert_raises(TOTS::Fail) { assert_nil('') }
        assert_raises(TOTS::Fail) { assert_nil(0) }
      end
    end

    describe "assert_includes" do
      it "must pass correctly" do
        assert_includes [1,2,3], 2
      end

      it "must fail correctly" do
        assert_raises(TOTS::Fail) { assert_includes([1,2,3], 4) }
        assert_raises(TOTS::Fail) { assert_includes(nil, 4) }
      end
    end

    describe "assert_match" do
      it "must pass correctly" do
        assert_match "22", /2/
      end

      it "must fail correctly" do
        assert_raises(TOTS::Fail) { assert_match("22", /3/) }
        assert_raises(TOTS::Fail) { assert_match("22", nil) }
      end
    end

    describe "assert_instance_of" do
      it "must pass correctly" do
        assert_instance_of '', String
      end

      it "must fail correctly" do
        assert_raises(TOTS::Fail) { assert_instance_of('', Integer) }
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
