module Style
  class Results

    class << self

      attr_reader :sentences

      def print(sentences)
        @sentences = sentences.select {|sentence| ! sentence.problems.empty? }
        puts to_a.join("\n")
      end

      def to_a
        sentences.map do |sentence|
          sentence.problems.map do |problem|
          "#{problem.class} : #{sentence.text}"
          end
        end.flatten
      end

    end

  end
end
