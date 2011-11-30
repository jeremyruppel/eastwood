$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "eastwood/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "eastwood"
  s.version     = Eastwood::VERSION
  s.authors     = ["Jeremy Ruppel"]
  s.email       = ["jeremy.ruppel@gmail.com"]
  s.homepage    = "https://github.com/jeremyruppel/eastwood"
  s.summary     = "Start your client side out right"
  s.description = "Start your client side out right"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "cucumber"
end
