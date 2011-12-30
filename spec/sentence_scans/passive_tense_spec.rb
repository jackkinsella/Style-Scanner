require "spec_helper"
module Style
    module SentenceScans
        # using examples from: http://www.ego4u.com/en/cram-up/grammar/passive
        describe PassiveTense do
            let(:present) {Sentence.new "A letter is written."}
            let(:simple_past) {Sentence.new "My bike was stolen."}
            let(:present_perfect) {Sentence.new "A letter has been written."}
            let(:future) {Sentence.new "A letter will be written."}
            let(:hilfsverben) {Sentence.new "A letter can be written"}
            let(:present_progressive) {Sentence.new "A letter is being written."}
            let(:past_progressive) {Sentence.new "A letter was being written."}
            let(:past_perfect) {Sentence.new "A letter had been written."}
            let(:conditional_1) {Sentence.new "A letter would be written."}
            let(:conditional_2) {Sentence.new "A letter would have been written."}


            let(:active_present) {Sentence.new "Rita writes a letter"}
            let(:active_simple_past) {Sentence.new "Rita stoke my bike"}
            let(:active_present_perfect) {Sentence.new "Rita has written a letter."} 
            let(:active_future) {Sentence.new "Rita will write a letter."}
            let(:active_hilfsverben) {Sentence.new "Rita can write a letter."}
            let(:active_present_progressive) {Sentence.new "Rita is writing."}
            let(:active_past_progressive) {Sentence.new "Rita was writing."}
            let(:active_past_perfect) {Sentence.new "Rita had written."}
            let(:active_conditional_1) {Sentence.new "Rita would write."}
            let(:active_conditional_2) {Sentence.new "Rite would have written."}

            context "#scan" do
                it "catches present passives" do
                    should_problem present, Problems::PassiveTense
                end
                it "catches simple_past" do
                    should_problem simple_past, Problems::PassiveTense
                end

                it "catches future" do
                    should_problem future, Problems::PassiveTense
                end

                it "catches hilfsverben" do
                    should_problem hilfsverben, Problems::PassiveTense
                end

                it "catches present_perfect" do
                    should_problem present_perfect, Problems::PassiveTense
                end


                it "catches present_progressive" do
                    should_problem present_progressive, Problems::PassiveTense
                end

                it "catches past_progressive" do
                    should_problem past_progressive, Problems::PassiveTense
                end

                it "catches past_perfect" do
                    should_problem past_perfect, Problems::PassiveTense
                end

                it "catches present_perfect" do
                    should_problem present_perfect, Problems::PassiveTense
                end

                it "catches conditional_1" do
                    should_problem conditional_1, Problems::PassiveTense
                end

                it "catches conditional_2" do
                    should_problem conditional_2, Problems::PassiveTense
                end


                it "doesnt catches active_present" do
                    should_not_problem active_present, Problems::PassiveTense
                end

                it "doesnt catches active_simple_past" do
                    should_not_problem active_simple_past, Problems::PassiveTense
                end

                it "doesnt catches active_future" do
                    should_not_problem active_future, Problems::PassiveTense
                end

                it "doesnt catches active_hilfsverben" do
                    should_not_problem active_hilfsverben, Problems::PassiveTense
                end

                it "doesnt catches active_present_perfect" do
                    should_not_problem active_present_perfect, Problems::PassiveTense
                end

                it "doesnt catches active_present_progressive" do
                    should_not_problem active_present_progressive, Problems::PassiveTense
                end

                it "doesnt catches active_past_progressive" do
                    should_not_problem active_past_progressive, Problems::PassiveTense
                end

                it "doesnt catches active_past_perfect" do
                    should_not_problem active_past_perfect, Problems::PassiveTense
                end

                it "doesnt catches active_present_perfect" do
                    should_not_problem active_present_perfect, Problems::PassiveTense
                end

                it "doesnt catches active_conditional_1" do
                    should_not_problem active_conditional_1, Problems::PassiveTense
                end

                it "doesnt catches active_conditional_2" do
                    should_not_problem active_conditional_2, Problems::PassiveTense
                end

            end
        end
    end
end
