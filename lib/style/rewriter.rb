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
    end

    def rewrite
      remove_words
      substitute_words
      remove_adverbs
      remove_double_spaces
      remove_white_space_around_full_stops
      finished_text
    end

    private

    def remove_adverbs
      part_of_speech("RB").each do |word|
        @finished_text.gsub!(/\b#{word}\b/, "")
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

    def remove_words
      WORD_REMOVALS.each do |offender|
        @finished_text.gsub!(/\b#{offender.to_s}\b/, "")
      end
    end

    def substitute_words
      WORD_SUBSTITUTIONS.each do |offender, replacement|
        @finished_text.gsub!(/\b#{offender.to_s}\b/, replacement.to_s)
      end
    end

  end
end
