module Style
  module SentenceScans
    class Adverb < Base

      def scan
        adverbs.each do |adverb|
          create_problem(adverb)
        end
      end

      private

      def adverbs
        part_of_speech("RB")
      end

    end
  end
end
