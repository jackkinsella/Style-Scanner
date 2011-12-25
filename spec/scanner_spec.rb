require "spec_helper"
module Style
  # make sure each example only has one grammatical error

  describe Scanner do
    def should_alert(sentence, alert_type, correct_sentence = nil)
      sentence_alerts = subject.find_sentence(sentence).alerts(alert_type)
      sentence_alerts.size.should == 1
      sentence_alerts[0].suggestion.should == correct_sentence if correct_sentence 
    end

    def should_not_alert(sentence, alert_type)
      sentence_alerts = subject.find_sentence(sentence).alerts(alert_type)
      sentence_alerts.size.should == 0
    end

    context "general" do
      context "#find_sentence" do
        text = "Sentence Number 1. Sentence Number 2"
        sentence = Scanner.new(text).find_sentence("Sentence Number 2")
        sentence.text.should == "Sentence Number 2"
      end
      context "#sentences" do
        let(:text) {
          "My name is Jack. I am the creator of this program." 
        }
        it "splits into sentences correctly" do
          sentences = Scanner.new(text).sentences
          sentences.size.should == 2
          last_sentence = sentences[1]
          last_sentence.class.should == Sentence
          last_sentence.text.split.first.should == "I"
        end
      end
    end

    context "alerts" do
      ALERT_SENTENCES =  {:utilize_sentence => "We will utilize these apples.", :utilize_uppercase_sentence => "Our Paper Utilizes Stuff"}

      ALERT_SENTENCES.each do |sentence_name, sentence_text|
        let(sentence_name) {sentence_text}
      end

      let(:input_text) { ALERT_SENTENCES.each_value.to_a.join(" ") }
      subject { Scanner.new(input_text) }
      before(:all) do
        subject.scan
      end

      context "ugly word" do
        it "recommends you replaces utilize with use" do
          should_alert utilize_sentence, UglyWord, "We will use these apples."
        end
        it "handles uppercase" do
          should_alert utilize_uppercase_sentence, UglyWord, "Our Paper Uses Stuff"
        end
      end
      context "useless words" do
        it "removes the word 'very'" do
          should_alert "It was a very good idea.", UselessWord, "It was a good idea."
        end
      end

      context "white space" do
        it "removes spaces before full stops" do
          should_alert "I ran .", ExcessWhiteSpace, "I ran."
        end
        it "removes double spaces" do
          should_alert "It was a  place.", ExcessWhiteSpace, "It was a place."
        end
      end

      context "adverbs" do
        it "removes 'quickly' from ran quickly" do
          should_alert "He ran quickly.", Adverb, "He ran."
        end
      end

      context "broken links" do 
        it "approves working links" do
          should_not_alert "View our website: http://www.google.com/", BrokenLink
        end
        it "flags broken links" do
          should_alert "View our website: http://www.xyasdfasdfsdfas.com/", BrokenLink
        end
      end
      context "unclosed parenthesis"
      context "uncapitalized starting lines"
      context "forgotten full stop"
      context "repeated words" do 
        it "should remove words repeated in a row" do
          should_alert "I went went to the shop", RepeatedWord, "I went to the shop"
        end
        it "removes words repeated in a row where one is capitalized" do
          should_alert "I went Went to the shop", RepeatedWord, "I went to the shop"
          should_alert "I Went went to the shop", RepeatedWord, "I went to the shop"
        end
      end
      context "overused words"
      context "long words"
      context "passive tense" do
      end
    end

  end
end
