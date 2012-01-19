module Style
  module SentenceScans
    class Cliche < Base

      CLICHES_FILE_LOCATION = File.expand_path("../../../dictionaries/cliches.txt", __FILE__)
      CLICHES = IO.read(CLICHES_FILE_LOCATION).split("\n")

      def scan
        CLICHES.each do |cliche|
          create_problem(cliche) if sentence.contains?(cliche)
        end
      end

    end
  end
end
