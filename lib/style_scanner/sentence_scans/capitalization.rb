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
        flag_lowercase(MONTHS)
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
        collection.each do |word|
          create_problem(word.downcase) if sentence.contains?(word, :strip_case => false)
        end
      end

      def flag_lowercase(collection)
        collection.each do |word|
          create_problem(word.capitalize) if sentence.contains?(word, :strip_case => false)
        end
      end

    end
  end
end
