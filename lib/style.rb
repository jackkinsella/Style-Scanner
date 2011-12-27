# internal dependencies

# external dependencies
require "log_buddy"
require "punkt-segmenter"
require 'colorize'
require "net/http"

#external setups
LogBuddy.init({
  :logger   => File.open(File.dirname(__FILE__) + "/../log/development.log") 
})

require "style/problems/base"
require "style/sentence_scans/base"
Dir[File.dirname(__FILE__) + '/**/*.rb'].each do |file|
  require file
end

module Style
end
