module Style
  # Module is used to help people trace where the monkey patched methods came from http://olabini.com/blog/2011/01/safeer-monkey-patching/
  module StringExtensions

    def strip_punctuation
      gsub(/[^a-zA-Z0-9\-\s]/, "").gsub(/\s{2,}/, " ")
    end

    def stem_verbs
      strip_punctuation.split.map do |word|
        is_a_verb?(word) ? word.stem : word
      end.join(" ")
    end

    private

    def is_a_verb?(word)
      tag(word).start_with?("V")
    end

    def tag(word)
      Tagger.new(self).tagged_words.find {|tagged_word| tagged_word.word == word}.tag
    end

  end
  ::String.send :include, StringExtensions
end
