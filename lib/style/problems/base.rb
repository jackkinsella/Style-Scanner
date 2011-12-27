module Style
  module Problems
    class Base
      attr_reader :offending_text, :sentence

      def initialize(sentece, offending_text)
        @sentence = sentence
        @offending_text = offending_text
      end

      def on_text?(text)
        offending_text.strip_punctuation == text.strip_punctuation
      end

      def user_friendly_readout
        [1,2,3].join(" | ")
      end

    end
  end
end
