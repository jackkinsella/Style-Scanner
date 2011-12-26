module Style
  class Sentence 
    
    extend Forwardable
    def_delegators :@text, :gsub!, :match

    attr_reader :alerts, :text
    
    def initialize(text)
      @text = text
      @alerts = []
    end

    def find_alerts_by_type(alert_type)
      @alerts.select {|alert| alert.class == alert_type}
    end

    def add_alert(alert)
      alerts << alert
    end

    def to_s
      "Sentence Obj: text: #{text} alerts: #{alerts}"
    end
  end
end
