module Style
  module Alerts
    class Base
      attr_reader :sentence, :offending_word
      def initialize(sentence, offending_word)
        @sentence = sentence
        @offending_word = offending_word
      end

    end
  end
end
