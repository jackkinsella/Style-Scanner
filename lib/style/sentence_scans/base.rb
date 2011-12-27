module Style
  module SentenceScans
    class Base

      attr_reader :sentence

      def initialize(sentence)
        @sentence = sentence
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
      def tokenized_text
        @tokenized_text ||= sentence.respond_to?(:scanner) ? scanner.tokenized_text : Tokenizer.new(sentence.text).tokenize
      end

      def part_of_speech(code)
        tokenized_text.select {|k,v| v== code}.map &:first
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
        sentence.add_problem(problem_class.new(offending_text))
      end

    end
  end
end
