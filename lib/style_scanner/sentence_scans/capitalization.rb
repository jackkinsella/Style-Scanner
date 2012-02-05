module StyleScanner
  module SentenceScans
    class Capitalization < Base

      ACRONYMS = load_file("acronyms.txt")
      NATIONALITIES = load_file("nationalities.txt")
      MONTHS = %w(
     january february march april may june july august september october november december 
      )
      DAYS = %w(
        monday tuesday wednesday thursday friday saturday sunday
      )
      SEASONS = %w(
       Winter
       Summer
       Spring
       Autumn
      )

      def scan
        flag_lowercase(MONTHS) do |word|
          word == "may" && word.verb?
        end
        flag_lowercase(ACRONYMS)
        flag_lowercase(DAYS)
        flag_lowercase(NATIONALITIES)
        flag_uppercase(SEASONS)
        create_problem(first_letter) if first_letter_is_lowercase?
      end

      private

      def first_word
        words.first
      end

      def first_letter
        first_word.word.chars.first
      end

      def first_letter_is_lowercase?
        first_letter != first_letter.upcase
      end

      def flag_uppercase(collection)
        flag_case_problem(collection, :downcase)
      end

      def flag_lowercase(collection, &skipping_conditions)
        flag_case_problem(collection, :capitalize, &skipping_conditions)
      end

      def flag_case_problem(collection, problem_case, &skipping_conditions)
        words.each do |word|
        # skip if the proc, when called with the tagged word, evaluates to true
          next if skipping_conditions && skipping_conditions.call(word)

          collection.each do |capitalization_word| 
            create_problem(capitalization_word.send problem_case) if sentence.contains?(capitalization_word, :strip_case => false) && word == capitalization_word
          end

        end
      end

    end
  end
end
