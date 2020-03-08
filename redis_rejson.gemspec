# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis_rejson/version'

Gem::Specification.new do |spec|
  spec.name          = "redis_rejson"
  spec.version       = RedisRejson::VERSION
  spec.authors       = ["makevoid"]
  spec.email         = ["makevoid@gmail.com"]

  spec.summary       = %q{Redis ReJSON adapter}
  spec.description   = %q{Redis ReJSON (v4 Module - json manipulation) API adapter}
  spec.homepage      = "https://github.com/makevoid/redis-rejson-rb"
  spec.license       = "Unlicense"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "redis",       "~> 3.3"

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake",    "~> 12.3.3"
  spec.add_development_dependency "rspec",   "~> 3.0"
end
