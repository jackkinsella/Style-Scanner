module StyleScanner
  class TaggedWord
    #TODO add tests for all the new methods added here.

      STRUCTURAL_TAGS = %{
        WRB WPS WP WDT UH TO SYM PRPS CC DET EX IN LS PDT POS PRP PRPS
      }

    attr_reader :tag, :word

    def initialize(tag, word)
      @tag = tag.upcase
      @word = word 
    end

    def tokenized
      word.downcase.gsub(/\W/, "")
    end

    def adverb?
      tag.start_with?("RB")
    end
    
    def preposition?
      tag.start_with?("IN")
    end

    def determiner?
      tag.start_with?("DET")
    end

    def non_structural?
      ! STRUCTURAL_TAGS.include?(tag)
    end

    def possessive?
      ["POS", "PRP", "PRPS"].include?(tag)
    end

    def noun?
      tag.start_with?("NN")
    end

    def be_verb?
      verb? && ["is", "was", "been", "be"].include?(tokenized) 
    end

    def verb?
      tag.start_with?("V")
    end

    # Gerund verb = ING verb
    def gerund_verb?
      tag == "VBG" && tokenized != "being"
    end

  end
end
