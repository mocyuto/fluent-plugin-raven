# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name    = 'fluent-plugin-raven'
  spec.version = '0.1.4'
  spec.authors = ['Yuto Suzuki']
  spec.email   = ['yuutoo.advance@gmail.com']

  spec.summary       = 'sentry output plugin for Fluentd'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/mocyuto/fluent-plugin-raven'
  spec.license       = 'Apache-2.0'

  test_files, files  = `git ls-files -z`.split("\x0").partition do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.files         = files
  spec.executables   = files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = test_files
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'test-unit', '~> 3.0'
  spec.add_runtime_dependency 'fluentd', ['>= 0.14.10', '< 2']
  spec.add_runtime_dependency 'sentry-raven', '> 2'
end
