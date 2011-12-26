require "spec_helper"
module Style
    module SentenceScans
        describe PassiveTense do
            let(:present) {Sentence.new "A letter is written."}
            let(:simple_past) {Sentence.new "My bike was stolen."}
            let(:present_perfect) {Sentence.new "A letter has been written."}
            let(:future) {Sentence.new "A letter will be written."}
            let(:hilfsverben) {Sentence.new "A letter can be written"}

            let(:active_present) {Sentence.new "Rita writes a letter"}
            let(:active_simple_past) {Sentence.new "Rita stoke my bike"}
            let(:active_present_perfect) {Sentence.new "Rita has written a letter."} 
            let(:active_future) {Sentence.new "Rita will write a letter."}
            let(:active_hilfsverben) {Sentence.new "Rita can write a letter."}

            context "#scan" do
                it "catches all passives" do
                    should_alert present, Alerts::PassiveTense
                    should_alert simple_past, Alerts::PassiveTense
                    should_alert future, Alerts::PassiveTense
                    should_alert hilfsverben, Alerts::PassiveTense
                    should_alert present_perfect, Alerts::PassiveTense
                end
                it "does not catch any actives" do
                    should_not_alert active_present, Alerts::PassiveTense
                    should_not_alert active_simple_past, Alerts::PassiveTense
                    should_not_alert active_future, Alerts::PassiveTense
                    should_not_alert active_hilfsverben, Alerts::PassiveTense
                    should_not_alert active_present_perfect, Alerts::PassiveTense

                end
            end
        end
    end
end
