module Style
  module SentenceScans
    class ExcessWhiteSpaceScan < Base 
      def scan
        create_alert suggested_sentence if sentence.gsub!(/\s+/, " ")
      end
    end
  end
end
