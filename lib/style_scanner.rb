# Ruby core dependencies
require "net/http"
require "forwardable"

# External dependencies
require "punkt-segmenter"
require 'colorize'
require "engtagger"
require "sanitize"
require 'redcloth'
require 'trollop'

require "style_scanner/problems/base"
require "style_scanner/sentence_scans/base"
Dir[File.dirname(__FILE__) + '/**/*.rb'].each do |file|
  require file
end
