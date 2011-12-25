require 'rubygems'
require 'bundler/setup'
# User this when it's a full gem 
require 'style'


module StyleTestingHelpers
  def should_not_alert(sentence, alert_type)
    sentence.find_alerts_by_type(alert_type).size.should == 0
  end
  def should_alert(sentence, alert_type, offending_text=nil)
    alert = sentence.find_alerts_by_type(alert_type)
    alert.size.should == 1
  end
end

RSpec.configure do |config|
  config.include(StyleTestingHelpers)
end
