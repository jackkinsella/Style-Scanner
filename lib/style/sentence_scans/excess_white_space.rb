module Style
  module SentenceScans
    class ExcessWhiteSpace < Base 
      def scan(sentence)
        create_alert suggested_sentence if sentence.gsub!(/\s+/, " ")
      end
    end
  end
end
