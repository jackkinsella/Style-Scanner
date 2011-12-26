module Style
  module SentenceScans
    class UselessWord < Base
      USELESS_WORDS = ["very"]
      def scan
        USELESS_WORDS.each do |useless_word|
          create_alert(useless_word) if sentence.match /\b#{useless_word}\b/ 
        end
      end
    end
  end
end
