module Style
  module SentenceScans
    class Cliche < Base

      CLICHES = load_file("cliches.txt")

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
