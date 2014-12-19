# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nifty/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nate West"]
  gem.email         = ["natescott.west@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nifty"
  gem.require_paths = ["lib", "app"]
  gem.version       = Nifty::VERSION

  gem.add_dependency "padrino-core"
end
