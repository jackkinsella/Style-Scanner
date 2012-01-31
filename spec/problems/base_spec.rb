require "spec_helper"
module StyleScanner
  module Problems 
    describe Base do
      let(:sentence) {Sentence.new("I really like tomatoes.")}
      subject {Base.new(sentence, "really")}

      it "knows its offending text" do
        subject.offending_text.should == "really"
      end

      context "#user_friendly_readout" do
        it "is delimited by \ so that cut command will work in linux" do
          subject.user_friendly_readout.split("|").size.should == 3
        end
        it "shows stringified problem name first (taking into colorization)" do
          subject.user_friendly_readout.split("|")[0].strip.should match "Base"
        end
        it "shows problem sentence second" do
          subject.user_friendly_readout.split("|")[1].strip.should match "I really like tomatoes."
        end
        it "shows offending text third" do
          subject.user_friendly_readout.split("|")[2].strip.should match "really"
        end
      end

      context "#on_text?" do
        it "true if problem is on that word" do
          subject.on_text?("really").should be_true
        end
        it "false if problem is on a different word" do
          subject.on_text?("very").should be_false
        end
      end

    end
  end
end
