require "spec_helper"
module Style
    describe Tagger do
        let(:input) {"I am a wicked child."}

        context "#words_with_parts_of_speech_tags" do
            it "returns an array of words with their tags" do
                Tagger.new(input).words_with_parts_of_speech_tags.should == [["I", "PRP"], ["am", "VBP"], ["a", "DET"], ["wicked", "JJ"], ["child", "NN"],[".", "PP"]]
            end
        end
    end
end
