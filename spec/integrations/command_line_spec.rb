# coding: utf-8
require "spec_helper"
module StyleScanner
  describe "Command Line Interface" do

    let(:text) {"Tom hit the dlog."}
    let(:adverb_text) {"I talked quietly to the floor."}
    let(:html) {"<div id='dlog'><p> Tom hit the dog. </p></div>"}
    let(:textile) {"!/images/dlog.png! Tom hit the dog. "}
    let(:file) {Dir.pwd + "/spec/fixtures/sample_text.txt"}
    let(:scanner) {double(:scanner)}

    it "calls the scanner when cmd line called with an echoed sentence" do
      # mispelling error should show
      %x(echo '#{text}' | style-scanner -s).should match "dlog"
    end

    it "calls the scanner when cmd line called with a file" do
      %x(style '#{file}').should match "cliché"
    end

    it "works with HTML input" do
      # mispelling in html should not show if stripper properly
      %x(echo '#{html}' | style-scanner -h -s).should_not match "dlog"
    end

    it "doesn't do adverbs by default" do
      %x(echo '#{adverb_text}' | style-scanner).should_not match "quietly"
    end

    it "can turn on adverbs as needed using command line options" do
      %x(echo '#{adverb_text}' | style-scanner -a).should match "quietly"
    end

    it "works with Textile input" do
      # this test works because the software will visit the image link if the html is not stripped
      %x(echo '#{textile}' | style-scanner -t -s).should_not match "dlog"
    end

  end
end
