# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name    = 'fluent-plugin-raven'
  spec.version = '0.1.8'
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
  spec.required_ruby_version = '>= 2.5'

  spec.add_runtime_dependency 'fluentd', ['>= 0.14.10', '< 2']
  spec.add_runtime_dependency 'sentry-ruby', '< 5'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'test-unit'
end
