require "spec_helper"
module Style
  module SentenceScans
    describe ExcessWhiteSpaceScan do
      let(:space_before_stop) {Sentence.new "I ran ."}
      let(:double_spaces) {Sentence.new "It was a  place."}
      context "#scan" do
        it "removes spaces before full stops" do
          should_alert space_before_stop, Alerts::ExcessWhiteSpace, "I ran."
        end
        it "removes double spaces" do
          should_alert double_spaces, Alerts::ExcessWhiteSpace, "It was a place."
        end
      end
    end
  end
end

