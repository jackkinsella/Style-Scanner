module StyleScanner
  # Module is used to help people trace where the monkey patched methods came from http://olabini.com/blog/2011/01/safeer-monkey-patching/
  module StringExtensions

    def strip_punctuation
      gsub(/[^a-zA-Z0-9\-\s]/, "").gsub(/\s{2,}/, " ")
    end

    def stem_verbs
      strip_punctuation.split.map do |word|
        word.verb? ? word.stem : word
      end.join(" ")
    end

    def titlecase
      scan(/[A-Z][a-z]*/).join(" ") 
    end

    def stemmed_verbs?
      @stemmed_verbs
    end 

    def verb?
      tag.start_with?("V")
    end

    def tag
      Tagger.new(self).tagged_words.find {|tagged_word| tagged_word.word == self }.tag
    rescue NoMethodError
      "Unknown"
    end

  end
  ::String.send :include, StringExtensions
end
