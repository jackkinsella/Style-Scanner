module StyleScanner
  module SentenceScans
    class UglyWord < Base

      WORD_PAIRS= {"utilize" => "use", "necessitate" => "require", "leverage" => "use", "aforementioned" => "previous",
        "transpire" => "happen", "thusly" => "thus", "whilst" => "while", "tackle" => "solve"}

      def scan
        WORD_PAIRS.keys.each do |offender|
          create_problem("replace #{offender} with #{replacement_word(offender)}") if sentence.contains?(offender) 
        end
      end

    end
  end
end

