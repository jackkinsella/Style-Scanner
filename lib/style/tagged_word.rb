module Style
    class TaggedWord

        attr_reader :tag, :word
        
        def initialize(word_tag_pair)
            @word = word_tag_pair[0]
            @tag = word_tag_pair[1].upcase
        end

        def tokenized_word
            word.downcase.gsub(/\W/, "")
        end

    end
end
