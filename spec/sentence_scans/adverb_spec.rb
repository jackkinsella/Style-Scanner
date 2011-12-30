require "spec_helper"
module Style
  module SentenceScans
    describe Adverb do
      let(:adverb) {Sentence.new "He ran quickly."}
      context "#scan" do
        it "removes 'quickly' from ran quickly" do
          should_problem adverb, Problems::Adverb
        end
      end
    end
  end
end
