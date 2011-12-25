require "spec_helper"
module Style
  describe Sentence do
    let(:text) {"Christmas shopping for a dinosaur."}
    subject { Sentence.new(text) }
    it "hold a collection of alerts" do
      subject.alerts.should == []
    end
    it "lets you access original text" do
      subject.text.should == text 
    end
  end
end
