module Style
  module SentenceScans 
    class PassiveTense < Base

      # heuristic: A "BE" verb follwed by a verb other than a gerund
      def scan
        passive = words.find do |word|
          word.be_verb? && (! next_word(word).gerund_verb? ) && (! state_word?(word)) 
        end
        create_problem(word.word) if passive
      end

      private

      def state_word?(word)
        word = next_significant_word(word)
        word.noun? || word.possessive?
      end

    end
  end
end
