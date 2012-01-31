module Style
  module SentenceScans
    class SpeakingInGeneralities < Base

      GENERAL_WORDS = ["many", "various", "mostly", "largely",
        "huge", "a number", "significantly", "substantially",
        "vast", "relatively", "completely"]

      def scan
        GENERAL_WORDS.each do |useless_word|
          create_problem(useless_word) if sentence.contains?(useless_word) 
        end
      end
    end
  end
end

