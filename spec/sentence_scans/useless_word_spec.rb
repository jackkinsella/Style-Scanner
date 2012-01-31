require "spec_helper"
module StyleScanner
  module SentenceScans
    describe UselessWord do
      let(:very) {Sentence.new "It was a very good idea."}

      context "#scan" do
        it "removes the word 'very'" do
          should_problem very, Problems::UselessWord, "It was a good idea."
        end
      end
    end
  end
end
