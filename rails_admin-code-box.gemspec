# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_admin/code/box/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_admin-code-box"
  spec.version       = RailsAdmin::Code::Box::VERSION
  spec.authors       = ["Roman Simecek"]
  spec.email         = ["roman@good2go.ch"]

  spec.summary       = %q{Add code-box support to rails_admin.}
  spec.description   = %q{Extend rails_admin so that code-box attribute can be administrated.}
  spec.homepage      = "https://github.com/raskhadafi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rails_admin"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
