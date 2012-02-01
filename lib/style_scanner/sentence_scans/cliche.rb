module StyleScanner
  module SentenceScans
    class Cliche < Base

      STEMMED_CLICHES = load_file("stemmed_cliches.txt")
      CLICHES = load_file("cliches.txt")

      def scan
        STEMMED_CLICHES.each.with_index do |cliche, index|
          create_problem(CLICHES[index]) if sentence.contains?(cliche, :stem_verbs => true)
        end
      end

      class << self

        # used for generating new cliches. see generate_stemmed_cliches.rb
        def stemmed_cliches
          CLICHES.map do |cliche| 
            cliche.stem_verbs
          end
        end
      end

    end
  end
end
