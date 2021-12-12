# frozen_string_literal: true

require_relative "lib/ipgeobase/version"

Gem::Specification.new do |spec|
  spec.name = "ipgeobase"
  spec.version = Ipgeobase::VERSION
  spec.authors = ["Ivan Safronov"]
  spec.email = ["safrio@gmail.com"]

  spec.summary = "Fetching metadata by ip"
  spec.description = "Fetching metadata by ip"
  spec.homepage = "https://github.com/safrio/ipgeobase"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rake'
  spec.add_dependency 'rest-client'
  spec.add_dependency 'nokogiri-happymapper'
  spec.add_dependency 'addressable'

  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'minitest'
end