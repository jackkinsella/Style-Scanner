# WHAT: Turn the cliches.txt file into stemmed cliches
# WHY: Faster to do the necessary stemming work in advance
# USAGE: ruby generate_stemmed_cliches.rb
#
require "style_scanner"

def self.generate_stemmed_cliches_file
  stemmed_cliches_file = File.join(File.dirname(__FILE__), "lib", "dictionaries", "stemmed_cliches.txt")
  stemmed_cliches = StyleScanner::SentenceScans::Cliche.stemmed_cliches
  File.new(stemmed_cliches_file, "w").puts stemmed_cliches
end

generate_stemmed_cliches_file
