module Style
    module SentenceScans
        class InappropriateContraction < Base

            WORD_PAIRS = {"don't" => "do not", "can't" => 'cannot',
            "won't" => "will not", "shan't" => "shall not", 
            "hasn't" => "has not", "i'm" => "I am", "he'll" => "he will",
            "she'll" => "she will", "didn't" => "did not",
            "shouldn't" => "should not", "could've" => "could have",
            "they'll" => "they will", "we'll" => "we will"}

            def scan
                WORD_PAIRS.keys.each do |offender|
                    create_problem(replacement_word(offender)) if sentence.contains?(offender)
                end
            end

        end
    end
end
