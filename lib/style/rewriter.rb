module Style
  class Rewriter 
    WORD_SUBSTITUTIONS = [{:use => :utilize}]

    attr_reader :input_text
    attr_writer :finished_text

    def initialize(text)
      @input_text = text
      @finished_text = @input_text
    end

    def rewrite
      finished_text
    end

    private

    def substitute_words
      WORD_SUBSTITUTIONS.each do |offender, replacement|
        @finished_text.gsub!(/\b#{offender.to_s}\b/, replacement.to_s)
      end
    end

  end
end
