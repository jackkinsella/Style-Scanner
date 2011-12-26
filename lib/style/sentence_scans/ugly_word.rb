module Style
  module SentenceScans
    class UglyWord < Base

      STEMS = {"utilize" => "use"}
      CAPITALIZED_UGLY_WORDS = Hash[STEMS.map {|k,v| [k.capitalize, v.capitalize]}] 
      UGLY_WORDS = @@UGLY_WORDS ||= STEMS.update(CAPITALIZED_UGLY_WORDS)

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

