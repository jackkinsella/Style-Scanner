module Style
    module SentenceScans
        class RepeatedWord < Base

            def scan
                non_punctuation_tokens.
                    select {|token| non_punctuation_tokens.count(token) >= 2}.
                    each do |repeated_word|
                        create_problem(repeated_word)
                    end
            end

            private

            def non_punctuation_tokens
              words_with_parts_of_speech_tags.map(&:tokenized_word)
            end


        end
    end
end
