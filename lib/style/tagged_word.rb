module Style
  class TaggedWord
    #TODO add tests for all the new methods added here.

      STRUCTURAL_WORDS = %{
the of and a to in is you that it he was for on are as with his they I at be this have from or one had by but not what all were we when your can said there use an each which she do how their if will up other out then them these so some her would like him into has more no way could my than been who its did
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
      tag.start_with?("RBR")
    end

    def non_structural?
      ! STRUCTURAL_WORDS.include?(word)
    end

    def possessive?
      ["POS", "PRP", "PRPS"].include?(tag)
    end

    def noun?
      ["a", "the", "an"].include?(tokenized)
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
