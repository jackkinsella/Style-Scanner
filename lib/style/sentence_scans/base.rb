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
      def tagged_words
        @tagged_words ||= Tagger.new(sentence.text).tagged_words
      end

      def next_word(word)
        tagged_words.at(tagged_words.index(word) + 1)
      end

      def part_of_speech(code)
        tagged_words.select {|tagged_word| tagged_word.tag == code }.map &:word
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
