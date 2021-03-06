require "spec_helper"
module StyleScanner
  module SentenceScans

    describe Cliche do
      let(:push_envelope_present) {Sentence.new("We need to push the envelope.")}
      let(:push_envelope_present_capitals) {Sentence.new("We need to Push the envelope.")}
      let(:push_envelope_past) {Sentence.new("Our new business pushed the envelope.")}
      let(:push_envelope_gerund) {Sentence.new("We are pushing the envelope here. Seriously.")}
      let(:push_envelope_gerund_capitals) {Sentence.new("We are Pushing the Envelope. Seriously.")}
      let(:throw_envelope) {Sentence.new "We are throwing the envelope."}

      it "catches present" do
        should_problem push_envelope_present, Problems::Cliche
      end
      it "catches present capital letter cliches" do
        should_problem push_envelope_present_capitals, Problems::Cliche
      end
      it "catches past" do
        should_problem push_envelope_past, Problems::Cliche
      end
      it "catches gerund" do
        should_problem push_envelope_gerund, Problems::Cliche
      end
      it "catches capital letter gerund cliches" do
        should_problem push_envelope_gerund_capitals, Problems::Cliche
      end
      it "doesnt catch non cliches" do
        should_not_problem throw_envelope, Problems::Cliche
      end

    end

  end
end
