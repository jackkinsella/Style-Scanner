module Style
  module Alerts
    class Base
      attr_reader :sentence, :offending_text
      def initialize(sentence, offending_text)
        @sentence = sentence
        @offending_word = offending_text
      end

    end
  end
end
