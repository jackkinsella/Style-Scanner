module Style
  class Sentence
    attr_reader :alerts, :text
    def initialize(text)
      @text = text
      @alerts = []
    end
  end
end
