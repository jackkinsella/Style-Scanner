module Style
  module SentenceScans 
    class PassiveTense < Base
          
        # heuristic: A "BE" verb follwed by a verb other than a gerund
        def scan
           passive = tagged_words.find {|tagged_word| be_verb(tagged_word) && ! gerund_verb(next_word(tagged_word)) }
           create_problem(passive.word) if passive
        end

        private

        def be_verb(tagged_word)
          ["is", "was", "been", "be"].include?(tagged_word.tokenized_word) && tagged_word.tag.start_with?("V")
        end

        def gerund_verb(word)
          word && word.tag.start_with?("V") && word.tag == "VBG"
        end

          
    end
  end
end
