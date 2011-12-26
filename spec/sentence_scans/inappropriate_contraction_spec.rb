require "spec_helper"
module Style
    module SentenceScans
        describe InappropriateContraction do
            let(:dont) {Sentence.new "we don't look out."}
            let(:capitalized_dont) {Sentence.new "Don't look out."}
            let(:do_not) {Sentence.new "Do not look out"}
            context "#scan" do
                it "catches don't" do
                    should_alert dont, Alerts::InappropriateContraction
                end
                it "catches capitalized don't" do
                    should_alert capitalized_dont, Alerts::InappropriateContraction
                end
                it "does not catch 'does not'" do
                    should_not_alert do_not, Alerts::InappropriateContraction
                end
            end
        end
    end
end
