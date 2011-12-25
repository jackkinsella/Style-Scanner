module Style
  module SentenceScans
    class UselessWord < Base
      USELESS_WORDS = ["very"]

      def scan
        USELESS_WORDS.each do |useless_word|
          suggested_sentence = remove(useless_word)
          # don't add an alert is nothing found
          create_alert( suggested_sentence) if suggested_sentence
        end
      end
    end
  end
end
