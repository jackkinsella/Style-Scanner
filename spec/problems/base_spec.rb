require "spec_helper"
module Style
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
        it "shows stringified problem name first" do
          subject.user_friendly_readout.split("|")[0].should == "Useless Word"
        end
        it "shows problem sentence second" do
          subject.user_friendly_readout.split("|")[1].should == "I really like tomatoes."
        end
        it "shows offending word third" do
          subject.user_friendly_readout.split("|")[2].should == "really"
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
