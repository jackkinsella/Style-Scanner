module Style
  module SentenceScans
    class Capitalization < Base

      ACRONYMS = load_file("acronyms.txt")
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
      end

      private

      def flag_lowercase(collection)
        collection.each do |word|
          create_problem(word.upcase) if sentence.contains?(word, :strip_case => false)
        end
      end

    end
  end
end
