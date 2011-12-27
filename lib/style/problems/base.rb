module Style
  module Problems
    class Base
      attr_reader :offending_text, :sentence

      def initialize(sentence, offending_text)
        @sentence = sentence
        @offending_text = offending_text
      end

      def on_text?(text)
        offending_text.strip_punctuation == text.strip_punctuation
      end

      def user_friendly_readout
        [problem_name,sentence.text,offending_text].join(" | ")
      end

      private

      def problem_name
        self.class.to_s.gsub(/Style::Problems::/,"")
      end

    end
  end
end
