module StyleScanner
  module SentenceScans
    class UselessWord < Base

      USELESS_WORDS = ["extremely", "exceedingly", "quite",
        "remarkably", "surprisingly", "interestingly", "clearly",
        "very", "pretty" "fairly", "really"]

      def scan
        USELESS_WORDS.each do |useless_word|
          create_problem(useless_word) if sentence.contains?(useless_word) 
        end
      end

    end
  end
end
