require "spec_helper"
module Style
  module SentenceScans
    describe BrokenLink do
      let(:working_link) { Sentence.new("View our website: http://www.google.com/")} 
      let(:broken_link) { Sentence.new("View our website: http://www.xyasdfasdfsdfas.com/")}

      context "#scan" do
        it "approves working links" do
          should_not_problem working_link, Problems::BrokenLink
        end
        it "flags broken links" do
          should_problem broken_link, Problems::BrokenLink
        end
      end
    end
  end
end
