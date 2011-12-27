module Style
  module SentenceScans 
    class PassiveTense < Base
          
        # heuristic: A "BE" verb follwed by a verb other than a gerund
        def scan
           passive = tokenized_text.drop_while {|word_and_tag| ! be_verb(word_and_tag)}
           create_problem "to be verb" unless passive.empty?
        end

        private

        def be_verb(word_and_tag)
          tag = word_and_tag[1]
          word = word_and_tag[0]
          ["is", "was", "been", "be"].include?(word.downcase) && tag.start_with?("V")
        end

        def non_gerund_verb(word_and_tag)
          tag = word_and_tag[1]
          tag.start_with? "V" && tag != "VBG"
        end

          
    end
  end
end
