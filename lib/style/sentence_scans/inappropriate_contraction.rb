module Style
    module SentenceScans
        class InappropriateContraction

            WORD_PAIRS = {"don't" => "do not", "can't" => 'cannot',
            "won't" => "will not", "shan't" => "shall not", 
            "hasn't" => "has not", "i'm" => "I am", "he'll" => "he will",
            "she'll" => "she will", "didn't" => "did not",
            "shouldn't" => "should not", "could've" => "could have",
            "they'll" => "they will", "we'll" => "we will"}

            def scan
                capitalized_word_pairs.keys.each do |offender|
                    create_alert(replacement(offender)) if sentence.contains?(offender)
                end
            end

            private

            def capitalized_word_pairs
                capitalized_versions = Hash[WORD_PAIRS.map {|k,v| [k.capitalize, v.capitalize]}]
                WORD_PAIRS.update(capitalized_versions)
            end

            def replacement(offending_word)
              capitalized_word_pairs[offending_word]
            end

        end
    end
end
