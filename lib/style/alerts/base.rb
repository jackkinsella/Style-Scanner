module Style
  module Alerts
    class Base
      attr_reader :offending_text

      def initialize(offending_text)
        @offending_text = offending_text
      end

    end
  end
end
