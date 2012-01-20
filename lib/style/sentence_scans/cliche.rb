module Style
  module SentenceScans
    class Cliche < Base

      CLICHES_FILE_LOCATION = File.expand_path("../../../dictionaries/cliches.txt", __FILE__)
      CLICHES = IO.read(CLICHES_FILE_LOCATION).split("\n")

      def scan
        Cliche.stemmed_cliches.each.with_index do |cliche, index|
          create_problem(CLICHES[index]) if sentence.contains?(cliche, :stem_verbs => true)
        end
      end

      def self.stemmed_cliches
        @@stemmed_cliches ||= CLICHES.map do |cliche| 
          cliche.stem_verbs
        end
      end

    end
  end
end
