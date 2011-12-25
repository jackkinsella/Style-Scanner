require "spec_helper"
module Style
  # make sure each example only has one grammatical error

  describe Scanner do
    context "general" do
      context "#find_sentence" do
        text = "Sentence Number 1. Sentence Number 2"
        sentence = Scanner.new(text).find_sentence("Sentence Number 2")
        sentence.text.should == "Sentence Number 2"
      end
      context "#sentences" do
        let(:text) {
          "My name is Jack. I am the creator of this program." 
        }
        it "splits into sentences correctly" do
          sentences = Scanner.new(text).sentences
          sentences.size.should == 2
          last_sentence = sentences[1]
          last_sentence.class.should == Sentence
          last_sentence.text.split.first.should == "I"
        end
      end
    end

    context "unclosed parenthesis"
    context "uncapitalized starting lines"
    context "forgotten full stop"
    context "overused words"
    context "long words"
    context "passive tense" 

  end
end
