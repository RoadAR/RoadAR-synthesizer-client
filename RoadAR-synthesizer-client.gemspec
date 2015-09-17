lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RoadAR/synthesizer/client/version'

Gem::Specification.new do |spec|
  spec.name          = 'RoadAR-synthesizer-client'
  spec.version       = RoadAR::Synthesizer::Client::VERSION
  spec.authors       = ['Gleb Sinyavsky']
  spec.email         = ['zhulik.gleb@gmail.com']

  spec.summary       = %q{Gem-client for RoadAR-synthesizer microservice}
  spec.description   = %q{Gem-client for RoadAR-synthesizer microservice}
  spec.homepage      = 'https://github.com/RoadAR/RoadAR-synthesizer-client'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'httparty', '~> 0.13'
end
