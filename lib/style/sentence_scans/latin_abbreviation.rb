module Style
    module SentenceScans
        class LatinAbbreviation < Base

            LATINS = ["ie", "etc", "cf", "et cetera"]

            def scan
                dot_placement_permutations(LATINS).each do |latin_abbreviation|
                    create_alert(latin_abbreviation) if sentence.contains?(latin_abbreviation) 
                    # && hasnt_already_an_alert_on(latin_abbreviation)
                end
            end

            private

            def dot_placement_permutations(abbreviations)
                add_capitalizeds(abbreviations.map do |abbr|
                    [abbr, dot_at_end(abbr), dot_between_every_letter(abbr)]
                end, :all_caps => true).flatten
            end

            def dot_at_end(abbr)
                "#{abbr}."
            end

            # this method overshoots in permuations for some latins, but it
            # shouldn't matter
            def dot_between_every_letter(abbr)
                dot_between_all_but_last = abbr.split("").join(".")
                [dot_between_all_but_last, dot_at_end(dot_between_all_but_last)]
            end


        end
    end
end
