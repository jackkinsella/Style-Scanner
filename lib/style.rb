# internal dependencies

# external dependencies
require "punkt-segmenter"
require 'colorize'
require "engtagger"
require "net/http"

require "style/problems/base"
require "style/sentence_scans/base"
Dir[File.dirname(__FILE__) + '/**/*.rb'].each do |file|
  require file
end

module Style
end
