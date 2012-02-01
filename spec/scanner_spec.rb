require "spec_helper"
module StyleScanner
  # make sure each example only has one grammatical error

  describe Scanner do

    let(:text) { "My name is Roboticus. I am a really powerful robot." }
    subject {Scanner.new(text)}

    context "#scan" do
      it "calls a variety of scans on its sentences" do
        SentenceScans::UselessWord.should_receive(:scan).with(an_instance_of(Sentence)).twice.and_return(double(:sentence))
        subject.scan
      end
    end

    context "#sentences" do
      it "splits into sentences correctly" do
        sentences = subject.sentences
        sentences.size.should == 2
        last_sentence = sentences[1]
        last_sentence.class.should == Sentence
        last_sentence.text.split.first.should == "I"
      end
    end

  end
end
