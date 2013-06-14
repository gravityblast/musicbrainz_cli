# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'musicbrainz_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "musicbrainz_cli"
  spec.version       = MusicbrainzCli::VERSION
  spec.authors       = ["Andrea Franz"]
  spec.email         = ["andrea@gravityblast.com"]
  spec.description   = %q{Command Line Interface for the MusicBrainz database}
  spec.summary       = %q{MusicBrainz database CLI}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'active_musicbrainz'
  spec.add_dependency 'ripl'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
