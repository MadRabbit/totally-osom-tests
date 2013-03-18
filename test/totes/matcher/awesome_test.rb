require 'test_helper'

describe TOTES::Matcher do

  describe "awesome matchers" do
    describe "==" do
      it "must assert properly" do
        22.must == 22
      end

      it "must fail correctly" do
        assert_fails { 22.must == 33 }
      end
    end

    describe "!=" do
      it "must assert correctly" do
        22.must != 33
      end

      it "must fail correctly" do
        assert_fails { 22.must != 22 }
      end
    end

    describe "=~" do
      it "must assert correctly" do
        '22'.must =~ /2/
      end

      it "must fail correctly" do
        assert_fails { '22'.must =~ /3/ }
      end
    end

    describe ">" do
      it "must assert properly" do
        22.must > 11
      end

      it "must fail correctly" do
        assert_fails { 22.must > 22 }
        assert_fails { 22.must > 33 }
      end
    end

    describe "<" do
      it "must assert properly" do
        22.must < 33
      end

      it "must fail correctly" do
        assert_fails { 22.must < 22 }
        assert_fails { 22.must < 11 }
      end
    end

    describe ">=" do
      it "must assert properly" do
        22.must >= 11
        22.must >= 22
      end

      it "must fail correctly" do
        assert_fails { 22.must >= 21 }
      end
    end

    describe "<=" do
      it "must assert properly" do
        22.must <= 22
        22.must <= 33
      end

      it "must fail correctly" do
        assert_fails { 22.must <= 23 }
      end
    end
  end
end
