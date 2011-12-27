module Style
  module Problems
    class Base
      attr_reader :offending_text

      def initialize(offending_text)
        @offending_text = offending_text
      end

      def on_text?(text)
        offending_text.strip_punctuation == text.strip_punctuation
      end

    end
  end
end
