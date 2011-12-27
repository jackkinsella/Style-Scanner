require "spec_helper"
module Style
  module Problems 
    describe Base do
      subject {Base.new("really")}
      it "knows its offending text" do
        subject.offending_text.should == "really"
      end
      context "#on_text?" do
        let(:very) {Base.new("very")}
        it "true if problem is on that word" do
          very.on_text?("very").should be_true
        end
        it "false if problem is on a different word" do
          very.on_text?("really").should be_false
        end
      end
    end
  end
end
