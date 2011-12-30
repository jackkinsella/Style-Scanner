module Style
    module SentenceScans
        class Spelling < Base
            # notice the way you don't give hunspell any specific file so much
            # as the name both the aff and dic file use
            DICTIONARY = File.expand_path("../../../dictionaries/en_US", __FILE__)

            def scan
                mispellings.each do |mispelled_word|
                    create_problem(mispelled_word)
                end
            end

            private

            def mispellings
                `echo '#{sentence.text}' | hunspell -l -d #{DICTIONARY}`.split("\n")
            end

        end
    end
end
