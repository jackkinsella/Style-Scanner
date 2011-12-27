module Style
  module SentenceScans
    class ExcessWhiteSpace < Base 

      def scan
        white_space_problems.each do |problem|
          create_problem(problem.post_match) 
        end
      end

      private

      def white_space_problems
        between_words = sentence.match /\s{2,}/ 
        before_full_stop = sentence.match /\s{1,}\./
        before_commas = sentence.match /\s{1,}\,/
        [between_words, before_full_stop, before_commas].compact.flatten
      end

    end
  end
end
