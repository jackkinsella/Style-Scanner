require "spec_helper"
module Style
  module SentenceScans
    describe UglyWord do
      let(:utilize) {Sentence.new("We will utilize these apples.")}
      let(:utilize_uppercase) {Sentence.new("We Utilize Kleenex")}
      let(:utilize_plural) {Sentence.new("She utilizes her brain.")}
      let(:utilize_past) {Sentence.new("She utilized her brain.")}
      context "#scan" do
        it "recommends you replaces utilize with use" do
          should_alert utilize, Alerts::UglyWord, "We will use these apples."
        end
        it "also catches uppercase" do
          should_alert utilize_uppercase, Alerts::UglyWord, "We Use Kleenex"
        end
        it "also catches plural form" do
          should_alert utilize_plural, Alerts::UglyWord, "She uses her brain."
        end
        it "also catches past tense form" do
          should_alert utilize_past, Alerts::UglyWord, "She used her brain."
        end
      end
    end
  end
end
