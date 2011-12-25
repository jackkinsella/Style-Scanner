module Style
  module Alerts
    class Base

      attr_reader :suggestion
     
      def initialize(corrected_sentence)
        @suggestion = corrected_sentence
      end

    end
  end
end
