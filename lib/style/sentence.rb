module Style
  class Sentence < String
    attr_reader :alerts, :text
    def initialize(text)
      @text = text
      @alerts = []
    end

    def find_alerts_by_type(alert_type)
      @alerts.select {|alert| alert.class == alert_type}
    end

    def create_alert(alert_type, offending_text)
      @alerts << alert_type.new(self, offending_text)
    end

    def to_s
      "Sentence Obj: text: #{text} alerts: #{alerts}"
    end
  end
end
