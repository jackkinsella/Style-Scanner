module StyleScanner
  class Tagger

    attr_reader :input_text

    def initialize(input_text)
      @input_text = input_text
    end

    def tagged_words 
      @tagged_words ||= Tagger.parts_of_speech_tagger.
        add_tags(input_text).
        scan(/\<(?<tag>\w+)>(?<text>[^(<\)]+)</).
        map {|tag, word| TaggedWord.new(tag,word)}
    end

    class << self
      # load once since there is a high initialization cost
      def parts_of_speech_tagger
        @eng_tagger ||= EngTagger.new
      end

    end

  end
end
