require "spec_helper"
module Style
    describe "Command Line Interface" do

        let(:text) {"Tom hit the dog."}
        let(:file) {Dir.pwd + "/spec/fixtures/sample_text.txt"}
        let(:scanner) {double(:scanner)}

        it "works with an echoed sentence" do
          system("echo '#{text}' | style").should be_true
        end
        it "works with a file" do
            system("style #{file}").should be_true
        end
    end
end
