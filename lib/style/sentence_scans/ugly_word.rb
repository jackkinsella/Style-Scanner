module Style
  module SentenceScans
    class UglyWord < Base

      WORD_PAIRS= {"utilize" => "use", "necessitate" => "require", "leverage" => "use", "aforementioned" => "previous",
      "transpire" => "happen", "thusly" => "thus", "whilst" => "while", "tackle" => "solve"}

      def scan
        capitalized_word_pairs.keys.each do |offender|
          create_alert(replacement_word(offender)) if sentence.contains?(offender) 
        end
      end

    end
  end
end

