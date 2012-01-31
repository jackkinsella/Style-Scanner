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
        sentence.adverbs
      end

    end
  end
end
