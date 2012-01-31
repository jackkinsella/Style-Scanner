require "spec_helper"
module StyleScanner
    module SentenceScans
        describe SpeakingInGeneralities do

            let(:mostly) {Sentence.new "The flood was caused mostly by the increased rainfall."}
            context "#scan" do
                it "flags 'mostly'" do
                    should_problem mostly, Problems::SpeakingInGeneralities
                end
            end

        end
    end
end
