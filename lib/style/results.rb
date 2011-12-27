module Style
  class Results

    class << self

      attr_reader :sentences

      def print(sentences)
        @sentences = sentences.select {|sentence| sentence.with_problems? }
        puts to_a.join("\n")
      end

      def to_a
        sentences.map(&:problems).map(&:print).flatten
      end

    end

  end
end
