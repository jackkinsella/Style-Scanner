require "spec_helper"
module StyleScanner
  module SentenceScans
    describe UsedWordAlreadyInSentence do
      let(:double_nice) {Sentence.new "It was a nice place, and all the people were nice."}
      let(:consecutive_nice) {Sentence.new "It was a nice nice place."}
      let(:the) {Sentence.new "All through the night leaves were falling, and the moon was dark."}

      it "flags using the word nice twice" do
        should_problem double_nice, Problems::UsedWordAlreadyInSentence
      end
      it "doesn't flag where you have the word consecutively (since this is a separate error)" do
        should_not_problem consecutive_nice, Problems::UsedWordAlreadyInSentence
      end
      it "doesn't flag common words like 'the'" do
        should_not_problem the, Problems::UsedWordAlreadyInSentence
      end
    end

  end
end
