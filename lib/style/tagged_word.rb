module Style
  class TaggedWord

    attr_reader :tag, :word

    def initialize(tag, word)
      @tag = tag.upcase
      @word = word 
    end

    def tokenized_word
      word.downcase.gsub(/\W/, "")
    end

  end
end
