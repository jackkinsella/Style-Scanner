require "spec_helper"
module StyleScanner
  module SentenceScans
    describe Capitalization do

      let(:aids) {Sentence.new("John has aids.")}
      let(:lowercase_first_word) {Sentence.new("he went to the park.")}
      let(:nationality) {Sentence.new("We spoke english.")}
      let(:season) {Sentence.new("We travelled to England in the Summer.")}
      let(:month) {Sentence.new("We travelled to England in march.")}
      let(:uppercase_month) {Sentence.new("We travelled to England in March.")}
      let(:may_month) {Sentence.new("Reaching deals with Indian bureaucrats and Chinese mandarins set to defend the interests and the data of their countries rapidly growing online firms may be downright impossible.")}
      let(:may_verb) {Sentence.new "Reaching deals may be impossible."}
      let(:day) {Sentence.new "We arrive on wednesday"}

      it "catches lowercase months" do
        should_problem month, Problems::Capitalization
      end
      it "doesn't catch uppercase months" do
        should_not_problem uppercase_month, Problems::Capitalization
      end
      it "catches days" do
        should_problem day, Problems::Capitalization
      end
      it "catches first word of sentences" do
        should_problem lowercase_first_word, Problems::Capitalization
      end
      it "flags wrongly capitalized seasons" do
        should_problem season, Problems::Capitalization
      end
      it "flags may month lowercase" do
        should_problem may_month, Problems::Capitalization
      end
      it "does not flay may the verb" do
        should_not_problem may_verb, Problems::Capitalization
      end
      it "catches nationalities and languages" do
        should_problem nationality, Problems::Capitalization
      end
      it "catches acroynms" do
        should_problem aids, Problems::Capitalization
      end

      pending do
        it "catches placenames"
        it "catches persons names"
        it "catches events"
      end

    end
  end
end
