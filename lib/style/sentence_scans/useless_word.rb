module Style
  module SentenceScans
    class UselessWord < Base

      USELESS_WORDS = ["very", "pretty"]

      def scan
        USELESS_WORDS.each do |useless_word|
          create_alert(useless_word) if sentence.contains? useless_word 
        end
      end
    end
  end
end
