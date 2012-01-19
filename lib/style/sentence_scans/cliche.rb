module Style
  module SentenceScans
    class Cliche < Base

      CLICHES_FILE_LOCATION = File.expand_path("../../../dictionaries/cliches.txt", __FILE__)
      CLICHES = IO.read(CLICHES_FILE_LOCATION).split("\n")


      def scan
        stemmed_cliches.each do |cliche|
          create_problem("GOTCHA") if sentence.contains?(cliche)
        end
      end

      private 

      def stemmed_cliches
        CLICHES.map do |cliche| 
           cliche.split.map do |word|
             is_a_verb?(word) ? word.stem : word
           end.join(" ")
        end
      end

      def is_a_verb?(word)
        Tagger.new(word).tagged_words.first.tag.start_with?("V")
      end

    end
  end
end
