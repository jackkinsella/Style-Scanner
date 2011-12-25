module Style
  module SentenceScans
    class RepeatedWord < Base
      def scan
        consecutively_repeated_words = input_text.downcase.scan(REPEATED_WORD_REGEX).flatten
        # we need capitalization permutations, ordered by most likely
        consecutively_repeated_words.each do |word|
          # d word
          suggested_sentence = sentence.sub!(/\b#{word}\b\s+\b#{word}\b/, "#{word}") ||
            sentence.sub!(/\b#{word.capitalize}\b\s+\b#{word.capitalize}\b/, "#{word}") ||
            sentence.sub!(/\b#{word.capitalize}\b\s+\b#{word}\b/, "#{word}") ||
            sentence.sub!(/\b#{word}\b\s+\b#{word.capitalize}\b/, "#{word}")
          create_alert suggested_sentence
        end 
      end
    end
  end
end

