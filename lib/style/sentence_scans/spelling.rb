module Style
    module SentenceScans
        class Spelling < Base
            DICTIONARY = "/Applications/OpenOffice.org.app/Contents/share/extensions/dict-en/"

            def scan
                mispellings.each do |mispelled_word|
                    create_problem(mispelled_word)
                end
            end

            private

            def mispellings
                hunspell_return = `echo #{sentence} | hunspell -l -d #{DICTIONARY}`
                hunspell_return == "" ? [] : hunspell_return.split("\n")
            end

        end
    end
end
