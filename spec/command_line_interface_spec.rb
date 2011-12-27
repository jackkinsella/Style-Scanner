require "spec_helper"
module Style
    describe "Command Line Interface" do
        let(:text) {"Tom hit the dog."}
        let(:scanner) {double(:scanner)}
        it "should call scanner with text provided" do
            Scanner.should_receive(:new).with(text).and_return(scanner)
            scanner.should_receive(:scan)
            system("style '#{text}'")
        end
    end
end
