module Style
    module SentenceScans
        class RepeatedWord < Base

            STRUCTURAL_WORDS = %w(
the of and a to in is you that it he was for on are as with his they I at be this have from or one had by but not what all were we when your can said there use an each which she do how their if will up other out then them these so some her would like him into has more no way could my than been who its did)

        def scan
            repeated_words.each do |repeated_word|
                create_problem(repeated_word) 
            end
        end

        private

        def repeated_words 
            tokenized_words.select {|token| tokenized_words.count(token) >= 2 && non_structural_word?(token) && appears_non_consecutively(token) }.uniq
        end

        def appears_non_consecutively(word)
            tokenized_words[tokenized_words.index(word) + 1] != word
        end

        def non_structural_word?(word)
            ! STRUCTURAL_WORDS.include?(word)
        end

        def tokenized_words
            tagged_words.map(&:tokenized_word).
                reject {|word| word == ""}
    end

            end
        end
end
