module Style
  module SentenceScans
    class ExcessWhiteSpace < Base 

      def scan(sentence)
        between_words = sentence.match /\s{2,}/ 
        before_full_stop = sentence.match /\s{1,}\./
        before_commas = sentence.match /\s{1,}\./
        problems << [between_words, before_full_stop, before_commas]
        problems.each do |problem|
          create_alert(problem.post_match) 
        end
      end

      private

      def problems
        @problems ||= []
      end

    end
  end
end
