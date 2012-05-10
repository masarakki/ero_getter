# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ero_getter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["masarakki"]
  gem.email         = ["masaki@hisme.net"]
  gem.description   = %q{ero getter}
  gem.summary       = %q{ero getter}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ero_getter"
  gem.require_paths = ["lib"]
  gem.version       = EroGetter::VERSION
end
