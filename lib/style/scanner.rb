module Style
  class TokenizerNotWorking < StandardError
  end
  class Scanner 
    WORD_SUBSTITUTIONS = [[:utilize, :use]]
    USELESS_WORDS = ["very"]
    REPEATED_WORD_REGEX = /\b(\w+)\b\s+\1/

    attr_reader :input_text, :tokenized_text
    attr_accessor :finished_text

    def initialize(input_text)
      @input_text = input_text
      @finished_text = input_text
      @tokenized_text = tokenize_text
      @alerts = []
    end

    def scan 
      useless_words
      substitute_words
      adverbs_presence
      consecutively_repeated_words
      excess_white_spacing
      white_space_around_full_stops
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

    def consecutively_repeated_words
      consecutively_repeated_words = input_text.downcase.scan(REPEATED_WORD_REGEX).flatten
      # we need capitalization permutations, ordered by most likely
      consecutively_repeated_words.each do |word|
        # d word
        @finished_text.sub!(/\b#{word}\b\s+\b#{word}\b/, "#{word}") ||
          @finished_text.sub!(/\b#{word.capitalize}\b\s+\b#{word.capitalize}\b/, "#{word}") ||
          @finished_text.sub!(/\b#{word.capitalize}\b\s+\b#{word}\b/, "#{word}") ||
          @finished_text.sub!(/\b#{word}\b\s+\b#{word.capitalize}\b/, "#{word}")
      end 
    end


    def adverbs_presence 
      part_of_speech("RB").each do |word|
        remove word
      end
    end

    def white_space_around_full_stops
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

    def excess_white_spacing
      @finished_text.gsub!(/\s+/, " ")
    end

    def useless_words
      USELESS_WORDS.each do |useless_word|
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
