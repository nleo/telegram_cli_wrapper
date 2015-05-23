# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telegram_cli_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = 'telegram_cli_wrapper'
  spec.version       = TelegramCliWrapper::VERSION
  spec.authors       = ['Leo']
  spec.email         = ['nlpub0@gmail.com']

  spec.summary       = %q{Wrapper for command-line interface for Telegram}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = 'https://github.com/nleo/telegram_cli_wrapper'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end
