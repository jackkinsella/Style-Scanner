require "spec_helper"
module Style
  describe Sentence do
    let(:text) {"Christmas shopping shopping for a very big dinosaur."}
    let(:repeated_word_alert) {Alerts::RepeatedWord.new("shopping shopping")}
    let(:ugly_word_alert) {Alerts::UglyWord.new("utilize")}
    subject { Sentence.new(text) }

    it "hold a collection of alerts" do
      subject.alerts.should == []
    end
    
    it "lets you access original text" do
      subject.text.should == text 
    end

    context "delegations to string" do
      it "delegates match" do
        subject.match(/shopping/).should_not be_false
      end
    end

    context "#add_alert" do
      it "adds an alert to the sentence" do
        subject.add_alert(repeated_word_alert)
        subject.alerts.first.class.should == Alerts::RepeatedWord
      end
    end
    
    context "#contains?" do
      it "true if a word is contained within the text" do
       subject.contains?("shopping").should be_true
      end
      it "false if word not contained" do
       subject.contains?("soccer").should be_false
      end
      it "false if only part of a word" do
        subject.contains?("mas").should be_false
      end
    end
    context "#to_s" do
      it "displays the text" do
        subject.to_s.should match text
      end
      it "says its a sentence" do
        subject.to_s.should match /Sentence Obj/
      end
    end
    context "#find_alerts_by_type" do
      it "finds the alert according to its class" do
      subject.add_alert(repeated_word_alert)
      subject.add_alert(ugly_word_alert)
      found_alerts = subject.find_alerts_by_type(Alerts::UglyWord)
      found_alerts.size.should == 1
      found_alerts.first.class.should == Alerts::UglyWord 
      end
    end
  end
end
