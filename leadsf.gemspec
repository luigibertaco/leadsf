# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'leadsf/version'

Gem::Specification.new do |spec|
  spec.name          = "leadsf"
  spec.version       = Leadsf::VERSION
  spec.authors       = ["Luigi Bertaco Cristofolini"]
  spec.email         = ["luigibertaco@gmail.com"]
  spec.summary       = %q{Gem to manipulate data of Leads on SalesForce}
  spec.description   = %q{Gem to manipulate data of Leads on SalesForce using another gems}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"

  spec.add_development_dependency "coveralls"

  #spec.add_development_dependency "force"
  spec.add_runtime_dependency "force"
end
