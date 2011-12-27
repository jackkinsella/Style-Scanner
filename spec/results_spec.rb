require "spec_helper"
module Style
  describe Results do

    let(:unproblematic_sentence) {Sentence.new("John hit a dog.")}
    let(:problem) {Problems::PassiveTense.new(problematic_sentence, "was")}
    let(:problematic_sentence) {Sentence.new("A dog was hit.")}
    let(:sentences) {[unproblematic_sentence, problematic_sentence]}

    before do
      problematic_sentence.add_problem(problem)
    end

    context ".user_friendly_readout" do
      it "contains one line for every problematic sentence" do
        Results.user_friendly_readout(sentences).split("\n").size.should == 1
      end
      it "contains the user_friendly_readout of the problem" do
        Results.user_friendly_readout(sentences).should match(problem.user_friendly_readout)
      end
    end
  end
end
