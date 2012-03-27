# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "eastwood/version"

Gem::Specification.new do |s|
  s.name        = "eastwood"
  s.version     = Eastwood::VERSION
  s.authors     = ["Jeremy Ruppel"]
  s.email       = ["jeremy.ruppel@gmail.com"]
  s.homepage    = "https://github.com/jeremyruppel/eastwood"
  s.summary     = %q{Start your client side out right}
  s.description = %q{Start your client side out right}

  s.rubyforge_project = "eastwood"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"

  s.add_dependency 'rails'
  s.add_dependency 'coffee-rails'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'appraisal', '0.4.1'
  s.add_development_dependency 'rspec-rails', '2.8.1'
  s.add_development_dependency 'shoulda', '3.0.1'
  s.add_development_dependency 'execjs', '1.3.0'
  s.add_development_dependency 'simplecov', '0.6.1'
end
