# frozen_string_literal: true
# coding: utf-8

lib = File.expand_path("lib", __dir__).freeze
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib

require "fil/version"

Gem::Specification.new do |spec|
  spec.name = "fil"
  spec.version = Fil::VERSION
  spec.authors = ["Afri Schoedon", "Pedro Costa"]
  spec.email = ["ruby@q9f.cc", "pedro@subvisual.co"]

  spec.summary = %q{Ruby Filecoin library.}
  spec.description = %q{Library to handle Filecoin accounts, messages, and transactions.}
  spec.homepage = "https://github.com/q9f/fil.rb"
  spec.license = "Apache-2.0"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/q9f/fil.rb/issues",
    "changelog_uri" => "https://github.com/q9f/fil.rb/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://q9f.github.io/fil.rb/",
    "github_repo" => "https://github.com/q9f/fil.rb",
    "source_code_uri" => "https://github.com/q9f/fil.rb",
  }.freeze

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "abis"]
  spec.test_files = spec.files.grep %r{^(test|spec|features)/}

  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = ">= 2.7", "< 4.0"
end
