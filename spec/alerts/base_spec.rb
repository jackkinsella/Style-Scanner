require "spec_helper"
module Style
  module Alerts
    describe Base do
      subject {Base.new("really")}
      it "knows its offending text" do
        subject.offending_text.should == "really"
      end
    end
  end
end
