require 'spec_helper'
module Style
    module SentenceScans
        describe Base do
            let(:sentence) {Sentence.new("I am a dog.")}

            it ".scan" do
                it "initializes a new instance of itself and calls scan" do
                    new_scanner = double(:base).as_null_object
                    Base.should_receive(:new).and_return(new_scanner)
                    new_scanner.should_receive(:scan)
                    Base.scan(sentence)

                end
            end
        end
    end
end
