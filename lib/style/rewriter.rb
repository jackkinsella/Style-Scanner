module Style
  class TokenizerNotWorking < StandardError
  end
  class Rewriter 
    WORD_SUBSTITUTIONS = [[:utilize, :use]]
    WORD_REMOVALS = ["very"]

    attr_reader :input_text, :tokenized_text
    attr_accessor :finished_text

    def initialize(input_text)
      @input_text = input_text
      @finished_text = input_text
      @tokenized_text = tokenize_text
      @alerts = []
    end

    def rewrite
      remove_useless_words
      substitute_words
      remove_adverbs
      remove_consecutively_repeated_words
      remove_double_spaces
      remove_white_space_around_full_stops
      finished_text
    end
    
    def alerts(type=false)
      type ? alerts.select {|alert| alert.instance_of(type)} : @alerts
    end

    private

    def add_alerts(alert)
    end

    def remove(old_word)
      sub(old_word, "")
    end

    def sub(old_word, new_word)
      @finished_text.gsub!(/\b#{old_word}\b/, new_word)
    end

    def remove_consecutively_repeated_words
      consecutively_repeated_words = input_text.downcase.scan(repeated_word_regex).flatten
      # we need capitalization permutations, ordered by most likely
      consecutively_repeated_words.each do |word|
        # d word
        @finished_text.sub!(/\b#{word}\b\s+\b#{word}\b/, "#{word}") ||
        @finished_text.sub!(/\b#{word.capitalize}\b\s+\b#{word.capitalize}\b/, "#{word}") ||
        @finished_text.sub!(/\b#{word.capitalize}\b\s+\b#{word}\b/, "#{word}") ||
        @finished_text.sub!(/\b#{word}\b\s+\b#{word.capitalize}\b/, "#{word}")
      end 
    end

    def repeated_word_regex
      /\b(\w+)\b\s+\1/
    end

    def remove_adverbs
      part_of_speech("RB").each do |word|
        remove word
      end
    end

    def remove_white_space_around_full_stops
      @finished_text.gsub!(/\s+\./, ".")
    end

    def part_of_speech(code)
      tokenized_text.select {|k,v| v== code}.map &:first
    end

    def tokenize_text
      res = eval(%x{python #{File.dirname(__FILE__)}/tokenizer.py "#{input_text}"})
      if res == nil || res == "" 
        raise TokenizerNotWorking, "Result of script: #{res}" 
      else
        res
      end
    end

    def remove_double_spaces
      @finished_text.gsub!(/\s+/, " ")
    end

    def remove_useless_words
      WORD_REMOVALS.each do |useless_word|
        remove useless_word
      end
    end

    def substitute_words
      WORD_SUBSTITUTIONS.each do |offender, replacement|
        sub offender.to_s, replacement.to_s
      end
    end

  end
end
