# -*- encoding: utf-8 -*-
require File.expand_path('../lib/style/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jack Kinsella"]
  gem.email         = ["jack.kinsella@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{Formal English Style Guide: Write more effectively}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "style"
  gem.require_paths = ["lib"]
  gem.version       = Style::VERSION
  gem.add_dependency "punkt-segmenter"
  gem.add_dependency "colorize"
  gem.add_dependency "ffi-hunspell"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "ruby-debug19"
  gem.add_development_dependency "log_buddy"
  gem.add_development_dependency "looksee"
end
