require "spec_helper"
module Style
  describe Sentence do
    let(:text) {"Christmas shopping shopping for a very big dinosaur."}
    let(:repeated_word_problem) {Problems::ConsecutivelyRepeatedWord.new("shopping shopping", text)}
    let(:ugly_word_problem) {Problems::UglyWord.new("utilize", text)}
    subject { Sentence.new(text) }

    it "hold a collection of problems" do
      subject.problems.should == []
    end

    it "lets you access original text" do
      subject.text.should == text 
    end

    context "delegations to string" do
      it "delegates match" do
        subject.match(/shopping/).should_not be_false
      end
    end

    context "#add_problem" do
      it "adds an problem to the sentence" do
        subject.add_problem(repeated_word_problem)
        subject.problems.first.class.should == Problems::ConsecutivelyRepeatedWord
      end
    end

    context "#with_problems?" do
      it "true for sentences with problems" do
        subject.problems << double(:problem)
        subject.with_problems?.should be_true
      end
      it "false for sentences without problems" do
        subject.with_problems?.should be_false
      end
    end

    context "#contains?" do
      let(:flossed) {Sentence.new("I flossed my teeth")}
      it "true if a word is contained within the text" do
        subject.contains?("shopping").should be_true
      end
      it "false if word not contained" do
        subject.contains?("soccer").should be_false
      end
      it "false if only part of a word" do
        subject.contains?("mas").should be_false
      end
      it "stems verbs if option is passed" do
        flossed.contains?("floss", :stem_verbs => true).should be_true
      end
    end

    context "#to_s" do
      it "displays the text" do
        subject.to_s.should match text
      end
      it "says its a sentence" do
        subject.to_s.should match /Sentence Obj/
      end
    end

    context "#find_problems_by_type" do
      it "finds the problem according to its class" do
        subject.add_problem(repeated_word_problem)
        subject.add_problem(ugly_word_problem)
        found_problems = subject.find_problems_by_type(Problems::UglyWord)
        found_problems.size.should == 1
        found_problems.first.class.should == Problems::UglyWord 
      end
    end

  end
end
