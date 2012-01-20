module Style
  module SentenceScans 
    class PassiveTense < Base

      # heuristic: A "BE" verb follwed by a verb other than a gerund
      def scan
        passive = tagged_words.find do |tagged_word|
          tagged_word.be_verb? && (! next_word(tagged_word).gerund_verb? ) && (! state_word?(tagged_word)) 
        end
        create_problem(passive.word) if passive
      end

      private

      def state_word?(tagged_word)
        word = next_significant_word(tagged_word)
        word.noun? || word.possessive?
      end

    end
  end
end
