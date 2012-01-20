require 'spec_helper'
module Style
  describe TaggedWord do

    subject {TaggedWord.new("nn", "Hound-dog")}

    context "#word" do
      it "the original word" do
        subject.word.should == "Hound-dog"
      end
    end

    context "#tag" do
      it "uppercased representation of speech element" do
        subject.tag.should == "NN"
      end
    end

    context "#tokenized_word " do
      it "downcase and stripped of punctuation" do
        subject.tokenized_word.should == "hounddog"
      end
    end

    context "#adverb?" do
      let(:adverb) {TaggedWord.new("RBR", "faster")}
      it "true for adverbs" do
        adverb.adverb?.should be_true
      end
      it "false otherwise" do
        subject.adverb?.should be_false
      end
    end
  end
end
