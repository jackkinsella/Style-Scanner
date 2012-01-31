module Style
  module SentenceScans 
    class PassiveTense < Base

      # heuristic: A "BE" verb follwed by a verb other than a gerund
      def scan
        passives.each do |passive|
          create_problem(word_in_context(passive))
        end
      end

      private

      def passives
        words.find_all do |word|
          word.be_verb? && (! next_word(word).gerund_verb? ) && (! state_word?(word)) 
        end
      end

      def word_in_context(main_word)
        position_of_main_word = words.index(main_word)
        words[position_of_main_word-1, 3].map(&:word).join(" ")
      end

      def state_word?(word)
        word = next_significant_word(word)
        word.noun? || word.possessive?
      end

    end
  end
end
