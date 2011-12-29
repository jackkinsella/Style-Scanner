module Style
    class Tokenizer

        attr_reader :input_text

        def initialize(input_text)
            @input_text = input_text
        end

        def words_with_parts_of_speech_tags 
            Tokenizer.parts_of_speech_tagger.
                add_tags(input_text).
                scan(/\<(?<tag>\w+)>(?<text>[^(<\)]+)</).
                map {|tag, word| [word, tag.upcase ] }
        end

        class << self
            # load once since there is a high initialization cost
            def parts_of_speech_tagger
                @eng_tagger ||= EngTagger.new
            end
        end

    end
end
