module Style
  module SentenceScans
    class Base
      REPEATED_WORD_REGEX = /\b(\w+)\b\s+\1/

      attr_reader :sentence

      private

      def scanner
        sentence.scanner
      end

      def remove(old_word)
        sub(old_word, "")
      end

      def sub(old_word, new_word)
        sentence.gsub!(/\b#{old_word}\b/, new_word)
      end

      def tokenized_text
        scanner.tokenized_text 
      end

      def part_of_speech(code)
        tokenized_text.select {|k,v| v== code}.map &:first
      end

      def create_alert(offending_text, tokenized_text)
        class_name = "Alerts::#{self.class.to_s}"
        Kernel.const_get(class_name).new(sentence, offending_text)
      end

    end
  end
end
