module StyleScanner
  module ProfilingHelpers

    def start_profiling
      require 'ruby-prof'
      RubyProf.start
    end

    def output_profilng_results
      result = RubyProf.stop
      printer = RubyProf::GraphHtmlPrinter.new(result)
      output_file = File.new("performance_report.html", "w")
      printer.print(output_file, :min_percent=>0)
      puts "Output performance report to performance_report.html".green
    end

  end
end
