# coding: utf-8
require "spec_helper"
module Style
  describe "Command Line Interface" do

    let(:text) {"Tom hit the dlog."}
    let(:html) {"<div id='dlog'><p> Tom hit the dog. </p></div>"}
    let(:file) {Dir.pwd + "/spec/fixtures/sample_text.txt"}
    let(:scanner) {double(:scanner)}

    it "calls the scanner when cmd line called with an echoed sentence" do
      # mispelling error should show
      %x(echo '#{text}' | style).should match "dlog"
    end

    it "calls the scanner when cmd line called with a file" do
      %x(style '#{file}').should match "cliché"
    end

    it "works with HTML input" do
      # mispelling in html should not show if stripper properly
      %x(echo '#{html}' | style).should_not match "dlog"
    end

  end
end
