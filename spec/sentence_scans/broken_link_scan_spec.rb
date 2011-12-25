require "spec_helper"
module Style
  module SentenceScans
    describe BrokenLinkScan do
      let(:working_link) { Sentence.new("View our website: http://www.google.com/")} 
      let(:broken_link) { Sentence.new("View our website: http://www.xyasdfasdfsdfas.com/")}

      context "#scan" do
        it "approves working links" do
          should_not_alert working_link, Alerts::BrokenLink
        end
        it "flags broken links" do
          should_alert broken_link, Alerts::BrokenLink
        end
      end
    end
  end
end
