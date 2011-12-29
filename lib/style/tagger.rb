module Style
    class Tagger

        attr_reader :input_text

        def initialize(input_text)
            @input_text = input_text
        end

        def tagged_words 
            Tagger.parts_of_speech_tagger.
                add_tags(input_text).
                scan(/\<(?<tag>\w+)>(?<text>[^(<\)]+)</).
                map {|word_tag_pair| TaggedWord.new(word_tag_pair)}
        end

        class << self
            # load once since there is a high initialization cost
            def parts_of_speech_tagger
                @eng_tagger ||= EngTagger.new
            end
        end

    end
end
