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
    context "#find_alerts_by_type" do
      subject.add_alert(RepeatedWord, "shopping shopping")
      subject.add_alert(UselessWord,  "very")
      subject.find_alerts_by_type(UselessWord).should == alert_2
    end
  end
end
