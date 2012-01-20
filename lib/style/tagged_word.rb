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

    def adverb?
      tag.start_with?("RBR")
    end

    def possessive?
      ["POS", "PRP", "PRPS"].include?(tag)
    end

    def noun?
      ["a", "the", "an"].include?(tokenized_word)
    end

    def be_verb?
      verb? && ["is", "was", "been", "be"].include?(tokenized_word) 
    end

    def verb?
      tag.start_with?("V")
    end

    # Gerund verb = ING verb
    def gerund_verb?
      tag == "VBG" && tokenized_word != "being"
    end

  end
end
