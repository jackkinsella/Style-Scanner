module Style
  module SentenceScans
    class Cliche < Base

      CLICHES_FILE_LOCATION = File.expand_path("../../../dictionaries/cliches.txt", __FILE__)
      CLICHES = IO.read(CLICHES_FILE_LOCATION).split("\n")


      def scan
        stemmed_cliches.each do |cliche|
          create_problem("GOTCHA") if sentence.contains?(cliche, :stem_verbs => true)
        end
      end

      private 

      def stemmed_cliches
        CLICHES.map do |cliche| 
          cliche.stem_verbs(sentence)
        end
      end
    end
  end
end
