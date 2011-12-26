module Style
  module SentenceScans
    class Base
      REPEATED_WORD_REGEX = /\b(\w+)\b\s+\1/

      attr_reader :sentence

      def initialize(sentence)
        @sentence = sentence
      end

      private

      def capitalized_word_pairs
        # ruby searches for WORD_PAIRS on base class without the following line
        word_pairs = self.class::WORD_PAIRS
      end

      def add_capitalizeds(words, options = {})
        # Capitalizer.new(words).capitalize(:all_caps => true)

        words.flatten!
        all_caps = options[:all_caps]
        if words.kind_of? Hash
          capitalized_versions = Hash[words.map {|k,v| [k.capitalize, v.capitalize, (v.upcase if all_caps)]}]
          word_pairs.update(capitalized_versions)
        elsif words.kind_of? Array
          words.map {|word| [word, word.capitalize, (word.upcase if all_caps)]}.flatten
        end
      end

      def replacement_word(offending_word)
        capitalized_word_pairs[offending_word]
      end

      # We retokenize for the text case where no overall scanner is prepared
      def tokenized_text
        @tokenized_text ||= sentence.respond_to?(:scanner) ? scanner.tokenized_text : tokenizer.new(sentence.text).tokenize
      end

      def part_of_speech(code)
        tokenized_text.select {|k,v| v== code}.map &:first
      end

      def hasnt_already_an_alert_on(word)
        strip_punctuation(sentence.find_alerts_by_type(alert_name).offending_text) != strip_punctuation(word)
      end

      def alert_name
         self.class.to_s.gsub("Style::SentenceScans::", "")
      end

      def create_alert(offending_text)
        sentence.add_alert(Alerts.const_get(alert_name).new(offending_text))
      end

      def strip_punctuation(word)
        word.gsub(/[^a-zA-Z0-9-\s]/, "")
      end

    end
  end
end
