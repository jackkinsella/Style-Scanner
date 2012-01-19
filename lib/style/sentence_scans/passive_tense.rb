module Style
  module SentenceScans 
    class PassiveTense < Base
          
        # heuristic: A "BE" verb follwed by a verb other than a gerund
        def scan
           passive = tagged_words.find do |tagged_word|
             be_verb(tagged_word) && (! gerund_verb(next_word(tagged_word))) && (! noun(next_word(tagged_word))) && (! possessive(next_word(tagged_word)))
           end
           create_problem(passive.word) if passive
        end

        private

        def noun(word)
          ["a", "the", "an"].include?(word.tokenized_word)
        end

        def possessive(word)
          ["my", "your", "his", "her", "our", "their"].include?(word.tokenized_word)
        end

        def be_verb(tagged_word)
          ["is", "was", "been", "be"].include?(tagged_word.tokenized_word) && tagged_word.tag.start_with?("V")
        end

        # Gerund verb = ING verb
        def gerund_verb(word)
          word && word.tag == "VBG" && word.tokenized_word != "being"
        end

          
    end
  end
end
