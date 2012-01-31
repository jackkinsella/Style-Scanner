require "spec_helper"
module StyleScanner
  describe Tagger do
    let(:input) {"I am a wicked child."}

    context "#tagged_words" do
      it "returns an array of tagged words object" do
        tagged_words = Tagger.new(input).tagged_words
        tagged_words.count.should == 6
        tagged_words.first.kind_of?(TaggedWord).should be_true
      end
    end
  end
end
