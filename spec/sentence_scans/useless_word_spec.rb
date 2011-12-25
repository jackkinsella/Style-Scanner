require "spec_helper"
module Style
  module SentenceScans
    describe UselessWord do
      let(:very) {Sentence.new "It was a very good idea."}

      context "#scan" do
        it "removes the word 'very'" do
          should_alert very, Alerts::UselessWord, "It was a good idea."
        end
      end
    end
  end
end
