module Style
  module SentenceScans 
    class PassiveTense < Base

      # heuristic: A "BE" verb follwed by a verb other than a gerund
      def scan
        passives.each do |passive|
          create_problem(passive.word)
        end
      end

      private

      def passives
        words.find_all do |word|
          word.be_verb? && (! next_word(word).gerund_verb? ) && (! state_word?(word)) 
        end
      end

      def state_word?(word)
        word = next_significant_word(word)
        word.noun? || word.possessive?
      end

    end
  end
end
