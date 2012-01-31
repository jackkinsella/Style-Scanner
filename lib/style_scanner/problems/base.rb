# coding: utf-8
module StyleScanner
  module Problems
    class Base
      attr_reader :offending_text, :sentence

      def initialize(sentence, offending_text)
        @sentence = sentence
        @offending_text = offending_text
      end

      def on_text?(problematic_word)
        offending_text.strip_punctuation == problematic_word.strip_punctuation
      end

      def user_friendly_readout
        [problem_name.red,sentence.text.green,offending_text.yellow].join(" | ")
      end

      private

      def problem_name
        unformatted_name = self.class.to_s.gsub(/StyleScanner::Problems::/,"").titlecase
        return "Cliché" if unformatted_name == "Cliche"
        unformatted_name
      end

    end

    def self.problem_class_names_from_dir
      Dir[(File.dirname(__FILE__) + "/../sentence_scans/*.rb")].
        map {|filename| File.basename(filename, ".rb").split("_").map(&:capitalize).join } - ["Base"]
    end

    def self.dynamically_generate_problem_classes
      problem_class_names_from_dir.each do |problem_class_name|
        eval %Q{ class #{problem_class_name} < Base
                 end}
      end
    end

    dynamically_generate_problem_classes

  end
end
