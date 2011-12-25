module Style
  class Sentence
    attr_reader :alerts, :text
    def initialize(text)
      @text = text
      @alerts = []
    end

    def find_alerts_by_type(alert_type)
    end

    def add_alert(alert_type, target)
    end

    def to_s
      "Sentence Obj: text: #{text} alerts: #{alerts}"
    end
  end
end
