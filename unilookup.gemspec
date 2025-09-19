Gem::Specification.new do |spec|
  spec.name          = "unilookup"
  spec.version       = "0.1.0"
  spec.authors       = ["Martin Maciaszek"]
  spec.email         = ["martin@maciaszek.net"]

  spec.summary       = "A command line utility to lookup Unicode characters"
  spec.description   = "Search and display Unicode character information from the command line"
  spec.homepage      = "https://github.com/fastjack/unilookup-ruby"
  spec.license       = "GPL-3.0"

  spec.required_ruby_version = ">= 2.7.0"

  spec.files         = Dir["lib/**/*", "bin/*", "README.md", "LICENSE"]
  spec.bindir        = "bin"
  spec.executables   = ["unilookup"]
  spec.require_paths = ["lib"]

  spec.add_dependency "unicode-name", "~> 1.0"
  spec.add_dependency "tty-table", "~> 0.12"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end