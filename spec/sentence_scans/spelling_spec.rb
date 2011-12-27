require "spec_helper"
module Style
    module SentenceScans
        describe Spelling do

            let(:incorrect_spelling) {Sentence.new "I was acomodated."}

            context "#scan" do
              it "catches mispellings" do
                should_problem incorrect_spelling, Problems::Spelling
              end
            end

        end
    end
end
