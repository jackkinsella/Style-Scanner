require "spec_helper"
module Style
  module SentenceScans
    describe Capitalization do

      let(:aids) {Sentence.new("John has aids.")}
      let(:first_word) {Sentence.new("he went to the park.")}
      let(:nationalities) {Sentence.new("We spoke english.")}
      let(:season) {Sentence.new("We travelled to England in the Summer.")}
      let(:month) {Sentence.new("We travelled to England in March.")}

      it "catches months" do

      end
      it "catches first word of sentences" do

      end
      it "flags wrongly capitalized seasons" do

      end
      it "catches nationalities and languages" do

      end
      it "catches acroynms" do
        should_problem aids, SentenceScans::Capitalization
      end

      pending do
        it "catches placenames"
        it "catches persons names"
        it "catches events"
      end

    end
  end
end
