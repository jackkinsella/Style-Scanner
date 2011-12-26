require "spec_helper"
module Style
    module SentenceScans
        describe LatinAbbreviation do
            let(:ie) {Sentence.new "You should not have laughed at him, i.e. he gets angry quickly."}
            let(:ie_without_middle_dot) {Sentence.new "You should not have laughed at him, ie. he gets angry quickly."}
            let(:ie_without_final_dot) {Sentence.new "You should not have laughed at him, i.e he gets angry quickly."}
            let(:ie_without_dots) {Sentence.new "Mario sells cars, motorbikes, cars, ie engine stuff"}
            let(:ie_capitalized) {Sentence.new "Mario sells cars, motorbiks, engines, I.E. he gets angry quickly."}
            let(:double_word_abbreviation) {Sentence.new "We took notes on the cars, et cetera."}

            context "#scan" do
                it "catches i.e. with proper dot placement" do
                    should_not_alert ie, Alerts::LatinAbbreviation
                end
                it "catches ie without middle dot" do
                    should_alert ie_without_middle_dot, Alerts::LatinAbbreviation
                end
                it "catches ie without any dots" do
                    should_alert ie_without_dots, Alerts::LatinAbbreviation
                end
                it "catches ie capitalized" do
                    should_alert ie_capitalized, Alerts::LatinAbbreviation
                end
                it "catches ie without final dot" do
                    should_alert ie_without_final_dot, Alerts::LatinAbbreviation
                end
                it "catches double word abbreviations like 'et cetera'" do
                    should_alert double_word_abbreviation, Alerts::LatinAbbreviation
                end
            end
        end
    end
end
