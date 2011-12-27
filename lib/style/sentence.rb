module Style
  class Sentence 
    
    extend Forwardable
    def_delegators :copy_of_text, :gsub!, :match, :scan, :downcase, :sub!

    attr_reader :problems, :text
    
    def initialize(text)
      @text = text
      @problems = []
    end

    def find_problems_by_type(alert_type)
      @problems.select {|alert| alert.class == alert_type}
    end

    def contains?(word)
      text.match /\b#{word}\b/
    end

    def add_alert(alert)
      problems << alert
    end

    def to_s
      "Sentence Obj: text: #{text} problems: #{problems}"
    end

    private

    # we don't want to modify the original text
    def copy_of_text
      text.dup
    end
  end
end
