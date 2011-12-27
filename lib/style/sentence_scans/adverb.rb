module Style
  module SentenceScans
    class Adverb < Base
      def scan
        part_of_speech("RB").each do |word|
          create_problem word 
        end
      end
    end
  end
end
