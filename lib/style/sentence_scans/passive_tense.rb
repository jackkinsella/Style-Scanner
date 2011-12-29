module Style
  module SentenceScans 
    class PassiveTense < Base
          
        # heuristic: A "BE" verb follwed by a verb other than a gerund
        def scan
           passive = tagged_words.drop_while {|tagged_word| ! be_verb(tagged_word) && next_word_non_gerund_verb(tagged_word) }.first
           create_problem(passive.word) if passive
        end

        private

        def be_verb(tagged_word)
          ["is", "was", "been", "be"].include?(tagged_word.tokenized_word) && tagged_word.tag.start_with?("V")
        end

        def next_word_non_gerund_verb(tagged_word)
          next_tagged_word = tagged_words.at(tagged_words.index(tagged_word) + 1)
          next_tagged_word.tag.start_with? "V" && next_tagged_word.tag != "VBG"
        end

          
    end
  end
end
