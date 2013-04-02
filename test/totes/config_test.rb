describe TOTES::Config do

  describe TOTES::Config.new, "defualts" do
    it "must build a new config" do
      @subject.is_a?(TOTES::Config).must == true
    end

    it "must assign the current config" do
      TOTES::Config.current.must == @subject
    end

    it "must assign the default reporter" do
      @subject.reporter.is_a?(TOTES::Reporter::Dots).must == true
    end

    it "must return the same reporter through the class method" do
      TOTES::Config.reporter.must == @subject.reporter
    end
  end



end
