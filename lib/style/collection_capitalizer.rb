module Style
  class CollectionCapitalizer

    attr_reader :collection
    
    def initialize(collection)
      @collection = collection
    end

    def capitalize(options = {})
       @all_caps = options[:all_caps]
       collection.kind_of?(Hash) ? capitalize_hash : capitalize_array
    end

    private
    
    def capitalize_hash
       capitalized_versions = collection.inject({}) do |accum, entry|
         key = entry[0]
         value = entry[1]
         accum.update Hash[capitalized_permutations(key).zip(capitalized_permutations(value))]
       end
    end

    def capitalize_array
      collection.flatten.map {|word| capitalized_permutations(word) }.flatten
    end

    def capitalized_permutations(word)
      basic_res = [word, word.capitalize]
      @all_caps ? (basic_res << word.upcase) : basic_res
    end

  end
end
