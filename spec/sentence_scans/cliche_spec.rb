require "spec_helper"
module Style
  module SentenceScans

    describe Cliche do
      let(:push_envelope_past) {Sentence.new("Our new business pushed the envelope.")}
      let(:push_envelope_present) {Sentence.new("We need to push the envelope.")}
      let(:push_envelope_gerund) {Sentence.new("We are pushing the envelope here. Seriously.")}
      let(:push_envelope_capitals) {Sentence.new("We are Pushing the Envelope. Seriously.")}

      it "catches past" do
        should_problem push_envelope_past, Problems::Cliche
      end
      it "catches present" do
        should_problem push_envelope_present, Problems::Cliche
      end
      it "catches gerund" do
        should_problem push_envelope_gerund, Problems::Cliche
      end
      it "catches capital letter cliches" do
        should_problem push_envelope_capitals, Problems::Cliche
      end

    end

  end
end
