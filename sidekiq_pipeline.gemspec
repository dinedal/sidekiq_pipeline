# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq_pipeline/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq_pipeline"
  spec.version       = SidekiqPipeline::VERSION
  spec.authors       = ["Paul Bergeron"]
  spec.email         = ["paul.d.bergeron@gmail.com"]
  spec.summary       = %q{Supports defining 'pipelines' of workers in Sidekiq}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest", "~> 4.4.0"
  spec.add_development_dependency "turn", "~> 0.9.6"

  spec.add_dependency "sidekiq"
end
