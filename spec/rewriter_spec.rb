require "spec_helper"
module Style
  describe Rewriter do

    def should_rewrite(input_text, expected_text)
      subject = Rewriter.new(input_text)
      subject.rewrite.should == expected_text 
    end

    context "replacements" do
      it "recommends you replaces utilize with use" do
        should_rewrite "We will utilize these apples.", "We will use these apples."
      end
      it "handles uppercase" 
    end


    context "white space" do
      it "removes spaces before full stops" do
        should_rewrite("I ran .", "I ran.")
      end
      it "removes double spaces" do
        should_rewrite "It was a  place.", "It was a place."
      end
    end

    context "removals" do
      it "removes the word 'very'" do
        should_rewrite "It was a very good idea.", "It was a good idea."
      end
    end

    context "adverbs" do
      it "removes 'quickly' from ran quickly" do
        should_rewrite "He ran quickly.", "He ran."
      end
    end

    context "broken links"
    context "unclosed parenthesis"
    context "uncapitalized starting lines"
    context "repeated words" do 
      it "should remove words repeated in a row" do
        should_rewrite("I went went to the shop", "I went to the shop")
      end
    end
    context "overused words"
    context "long words"

    context "passive tense" do
    end

  end
end
