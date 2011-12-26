module Style
  # Module is used to help people trace where the monkey patched methods came from http://olabini.com/blog/2011/01/safeer-monkey-patching/
  module StringExtensions
    def strip_punctuation
      gsub(/[^a-zA-Z0-9-\s]/, "").gsub(/\s{2,}/, " ")
    end
  end
  ::String.send :include, StringExtensions
end
