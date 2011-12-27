module Style
  class Results

    attr_reader :problematic_sentences

    def initialize(sentences)
      @problematic_sentences= sentences.select {|sentence| ! sentence.alerts.empty? }
    end

    def to_s
      @problematic_sentences.each.with_index do |sentence, index|
        %Q{#{index}. #{sentence.alert.class}
          #{sentence}}
      end
    end

  end
end
