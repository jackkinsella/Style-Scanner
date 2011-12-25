require "spec_helper"
module Style
  module SentenceScans
    describe AdverbScan do
      let(:adverb) {Sentence.new "He ran quickly."}
      context "#scan" do
        it "removes 'quickly' from ran quickly" do
          should_alert adverb, Alerts::Adverb, "He ran."
        end
      end
    end
  end
end
