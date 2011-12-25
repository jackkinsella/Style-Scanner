require "spec_helper"
module Style
  module SentenceScans
    describe RepeatedWord do
      let(:consecutive_repeated_words) {Sentence.new "I went went to the shop"}
      let(:consecutive_repeated_words_capitalized1) {Sentence.new "I went Went to the shop"}
      let(:consecutive_repeated_words_capitalized) {Sentence.new "I Went went to the shop"}

      context "#scan" do
        it "should remove words repeated in a row" do
          should_alert consecutive_repeated_words, Alerts::RepeatedWord, "I went to the shop"
        end
        it "removes words repeated in a row where one is capitalized" do
          should_alert consecutive_repeated_words_capitalized1, Alerts::RepeatedWord, "I went to the shop"
          should_alert consecutive_repeated_words_capitalized2, Alerts::RepeatedWord, "I went to the shop"
        end
      end
    end
  end
end
