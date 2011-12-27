module Style
  class Results

    class << self

      attr_reader :sentences

      def user_friendly_readout(sentences)
        @sentences = sentences.select {|sentence| sentence.with_problems? }
        to_a.join("\n")
      end

      private

      def to_a
        sentences.map(&:problems).flatten.map(&:user_friendly_readout).flatten
      end

    end

  end
end
