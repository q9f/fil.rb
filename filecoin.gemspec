# frozen_string_literal: true

require_relative "lib/filecoin/version"

Gem::Specification.new do |spec|
  spec.name          = "filecoin"
  spec.version       = Filecoin::VERSION
  spec.authors       = ["Pedro Costa"]
  spec.email         = ["pedro@subvisual.co"]

  spec.summary       = "Interact with the Filecoin network"
  spec.description   = <<~DESCRIPTION
    Filecoin (https://filecoin.io/) is a distributed storage network based on a
    blockchain mechanism.  Filecoin miners provide storage capacity for the
    network, earning FIL by periodically prooving the specified capacity is
    provided to the network.

    The Filecoin blockchain maintains the ledger for FIL transactions, and
    implements the Filecoin VM for the execution of contracts and market
    mechanisms. These include storage deals, where clients pay miners to store
    data in the network.

    This gem makes use of the JSON RPC API made available by Lotus
    (https://lotu.sh/), the official implementation of the network.
  DESCRIPTION
  spec.homepage = "https://github.com/subvisual/filecoin-ruby"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/subvisual/filecoin-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/subvisual/filecoin-ruby/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.start_with?("spec/") }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "dry-struct", "~> 1.0"
end
