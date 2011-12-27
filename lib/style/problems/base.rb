module Style
  module Problems
    class Base
      attr_reader :offending_text, :sentence

      def initialize(sentence, offending_text)
        @sentence = sentence
        @offending_text = offending_text
      end

      def on_text?(problematic_word)
        offending_text.strip_punctuation == problematic_word.strip_punctuation
      end

      def user_friendly_readout
        [problem_name.red,sentence.text.green,offending_text.yellow].join(" | ")
      end

      private

      def problem_name
        self.class.to_s.gsub(/Style::Problems::/,"")
      end

    end
  end
end
