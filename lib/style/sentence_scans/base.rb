module Style
  module SentenceScans
    class Base
      REPEATED_WORD_REGEX = /\b(\w+)\b\s+\1/

      attr_reader :sentence

      def initialize(sentence)
        @sentence = sentence
      end

      private

      def remove(old_word)
        sub(old_word, "")
      end

      def sub(old_word, new_word)
        sentence.gsub!(/\b#{old_word}\b/, new_word)
      end

      def capitalized_word_pairs
        # ruby searches for WORD_PAIRS on base class without the following line
        word_pairs = self.class::WORD_PAIRS
        capitalized_versions = Hash[word_pairs.map {|k,v| [k.capitalize, v.capitalize]}]
        word_pairs.update(capitalized_versions)
      end

      def replacement_word(offending_word)
        capitalized_word_pairs[offending_word]
      end

      # We retokenize for the text case where no overall scanner is prepared
      def tokenized_text
        @tokenized_text ||= sentence.respond_to?(:scanner) ? scanner.tokenized_text : Tokenizer.new(sentence.text).tokenize
      end

      def part_of_speech(code)
        tokenized_text.select {|k,v| v== code}.map &:first
      end

      def create_alert(offending_text)
        alert_name = self.class.to_s.gsub("Style::SentenceScans::", "")
        sentence.add_alert(Alerts.const_get(alert_name).new(offending_text))
      end

    end
  end
end
