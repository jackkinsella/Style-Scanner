module Style
  module SentenceScans
    class UsedWordAlreadyInSentence < Base

      def scan
        repeated_words.each do |repeated_word|
          create_problem(repeated_word.word) 
        end
      end

      private

      def repeated_words 
        tagged_words.select do |word|
          appears_more_than_twice(word) && word.non_structural? && appears_non_consecutively(word.tokenized) 
        end.uniq
      end

      def appears_more_than_twice(word)
        tokenized_words.count(word.tokenized) >= 2
      end

      def appears_non_consecutively(word)
        tokenized_words[tokenized_words.index(word) + 1] != word
      end

    end
  end
end
