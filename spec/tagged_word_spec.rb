require 'spec_helper'
module Style
    describe TaggedWord do

        subject {TaggedWord.new(["Hound-dog", "nn"])}

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
    end
end
