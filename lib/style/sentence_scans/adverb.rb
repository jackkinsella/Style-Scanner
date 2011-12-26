module Style
  module SentenceScans
    class Adverb < Base
      def scan(sentence)
        part_of_speech("RB").each do |word|
          suggested_sentence = remove(word)
          create_alert suggested_sentence
        end
      end
    end
  end
end
