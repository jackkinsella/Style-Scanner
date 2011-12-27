module Style
  module SentenceScans
    class RepeatedWord < Base

      REPEATED_WORD_REGEX = /\b(\w+)\b\s+\1/

      def scan
        consecutively_repeated_words = sentence.downcase.scan(REPEATED_WORD_REGEX).flatten
        consecutively_repeated_words.each do |repeated_word|
          create_problem repeated_word 
        end 
      end

    end
  end
end

