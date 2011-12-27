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
                    should_problem utilize, Problems::UglyWord, "We will use these apples."
                end
                it "also catches uppercase" do
                    should_problem utilize_uppercase, Problems::UglyWord, "We Use Kleenex"
                end
                pending "conjugation awareness" do
                    it "also catches plural form" do
                        should_problem utilize_plural, Problems::UglyWord, "She uses her brain."
                    end
                    it "also catches past tense form" do
                        should_problem utilize_past, Problems::UglyWord, "She used her brain."
                    end
                end
            end
        end
    end
end
