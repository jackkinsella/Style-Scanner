module Style
  module SentenceScans
    class Capitalization < Base
      
      ACRONYMS = load_file("acronyms.txt")

      def scan
        ACRONYMS.each do |acronym|
          create_problem(acronym.upcase) if sentence.contains?(acronym)
        end
      end

    end
  end
end
