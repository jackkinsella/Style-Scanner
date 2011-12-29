module Style
    class Tokenizer

        include Errors
        attr_reader :input_text, :tokenized_text

        def initialize(input_text)
            @input_text = input_text
        end

        # returns format
        #  [["I", "PRP"], ["am", "VBP"], ["a", "DET"], ["wicked", "JJ"], ["child", "NN"], [".", "PP"], ["A", "DET"], ["letter", "NN"], ["was", "VBD"], ["written", "VBN"], [".", "PP"]]
        
        def tokenize
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
