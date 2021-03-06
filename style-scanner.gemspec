# -*- encoding: utf-8 -*-
require File.expand_path('../lib/style_scanner/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jack Kinsella"]
  gem.email         = ["jack.kinsella@gmail.com"]
  gem.description   = %q{Flag errors with your writing Style}
  gem.summary       = %q{Formal English Style Guide: Write more effectively}
  gem.homepage      = "http://www.jackkinsella.ie"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "style-scanner"
  gem.require_paths = ["lib"]
  gem.version       = StyleScanner::VERSION
  gem.add_dependency "punkt-segmenter"
  gem.add_dependency "engtagger"
  gem.add_dependency "colorize"
  gem.add_dependency "sanitize"
  gem.add_dependency "trollop"
  gem.add_dependency "RedCloth"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "ruby-debug19"
  gem.add_development_dependency "looksee"
  gem.add_development_dependency "ruby-prof"

end
