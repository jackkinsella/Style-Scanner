require "spec_helper"
module Style
  describe "Command Line Interface" do

    let(:text) {"Tom hit the dog."}
    let(:file) {Dir.pwd + "/spec/fixtures/sample_text.txt"}
    let(:scanner) {double(:scanner)}

    it "calls the scanner when cmd line called with an echoed sentence" do
      Scanner.should_receive(:new).with(text).and_return(scanner)
      system("echo '#{text}' | style")
    end
    it "calls the scanner when cmd line called with a file" do
      Scanner.should_receive(:new).with(File.read(file)).and_return(scanner)
      system("style #{file}")
    end
  end
end
