module Style
  module SentenceScans
    class Base

      attr_reader :sentence

      def initialize(sentence)
        @sentence = sentence
      end

      def self.scan(sentence)
        new(sentence).scan
      end

      private

      def word_pairs
        # ruby searches for WORD_PAIRS on base class without the following line
        word_pairs = self.class::WORD_PAIRS
      end

      def capitalized_word_pairs
        add_capitalizeds(word_pairs)
      end

      def add_capitalizeds(words, options = {})
        CollectionCapitalizer.new(words).capitalize(:all_caps => true)
      end

      def replacement_word(offending_word)
        word_pairs[offending_word]
      end

      # We retokenize for the text case where no overall scanner is prepared
      def words_with_parts_of_speech_tags 
        @words_with_parts_of_speech_tags ||= sentence.respond_to?(:scanner) ? scanner.tokenized_text : Tagger.new(sentence.text).words_with_parts_of_speech_tags
      end

      def part_of_speech(code)
        words_with_parts_of_speech_tags.select {|k,v| v== code}.map &:first
      end

      def already_has_that_problem_on_text(offending_text)
        sentence.find_problems_by_type(problem_class).any? do |problem|
          problem.on_text?(offending_text)
        end
      end

      def problem_class
         Problems.const_get(self.class.to_s.gsub("Style::SentenceScans::", ""))
      end

      def create_problem(offending_text)
        sentence.add_problem(problem_class.new(sentence, offending_text)) unless already_has_that_problem_on_text(offending_text)
      end

    end
  end
end
