module Style
  module SentenceScans
    class UglyWordScan < Base
      UGLY_WORDs= {"utilize" => "use"}
      def scan
        UGLY_WORDS.keys.each do |offender|
          suggested_sentence = sub(offender, replacement(offender))
          create_alert(suggested_sentence) if suggested_sentence
        end
      end

      def replacement(offending_word)
        UGLY_WORDS[offending_word]
      end
    end
  end
end

