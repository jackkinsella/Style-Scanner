require "spec_helper"
module Style
  describe Sentence do
    let(:text) {"Christmas shopping shopping for a very big dinosaur."}
    subject { Sentence.new(text) }
    it "hold a collection of alerts" do
      subject.alerts.should == []
    end
    it "lets you access original text" do
      subject.text.should == text 
    end
    context "#create_alert" do
      it "creates an alert of a particular type to the sentence" do
        subject.create_alert(RepeatedWord, "shopping shopping")
        subject.alerts.first.class.should == RepeatedWord
      end
    end
    context "#find_alerts_by_type" do
      it "finds the alert according to its class" do
      subject.create_alert(RepeatedWord, "shopping shopping")
      subject.create_alert(UselessWord,  "very")
      found_alerts = subject.find_alerts_by_type(UselessWord)
      found_alerts.size.should == 1
      found_alerts.first.class.should == UselessWord
      end
    end
  end
end
