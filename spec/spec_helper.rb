require 'rubygems'
require "ruby-debug"
require 'bundler/setup'
# Use this when it's a full gem 
require 'style'

module StyleTestingHelpers

  def should_problem(sentence, problem_type, offending_text=nil)
    subject = described_class.new(sentence)
    subject.scan
    problem = sentence.find_problems_by_type(problem_type)
    problem.size.should == 1
  end

  def should_not_problem(sentence, problem_type)
    subject = described_class.new(sentence)
    subject.scan
    sentence.find_problems_by_type(problem_type).size.should == 0
  end

end

RSpec.configure do |config|
  config.include(StyleTestingHelpers)
end
