# encoding: UTF-8

$:.push File.expand_path("../lib", __FILE__)
require "concealer/version"

Gem::Specification.new do |s|
  s.name        = "concealer"
  s.version     = Concealer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Benedikt Deicke", "Christian Bäuerlein"]
  s.email       = ["benedikt@synatic.net", "fabrik42@gmail.com"]
  s.homepage    = "https://flinc.github.com/concealer"
  s.summary     = %q{Privacy control your models with ease}
  s.description = %q{Privacy control your models with ease}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency('activesupport', ['~> 3.0'])

  s.add_development_dependency('rspec', ['~> 2.6'])
  s.add_development_dependency('hanna-nouveau')
  s.add_development_dependency('rake')
end
