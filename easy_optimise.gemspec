# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_optimise/version'

Gem::Specification.new do |spec|
  spec.name          = "easy_optimise"
  spec.version       = EasyOptimise::VERSION
  spec.date          = EasyOptimise::DATE

  spec.summary       = "A simple paperclip attachment image optimiser."
  spec.description   = "A wrapper of the paperclip attachment handler that uses sane defaults to optimally compress attached images using imagemagick utility functions."

  spec.authors       = ["Philip Castiglione"]
  spec.email         = ["philipcastiglione@gmail.com"]
  spec.homepage      = "https://github.com/PhilipCastiglione/easy_optimise"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "paperclip", "~> 4.2"
end
