module Style
    module SentenceScans
        class LatinAbbreviation < Base

          LATINS = ["ie", "etc", "cf"]

          def scan
              LATINS.each do |latin_abbreviation|
                  create_alert(latin_abbreviation) if sentence.contains?(latin_abbreviation)
              end
          end

        end
    end
end
