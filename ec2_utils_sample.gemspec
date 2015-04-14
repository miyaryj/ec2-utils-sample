# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ec2_utils_sample/version'

Gem::Specification.new do |spec|
  spec.name          = "ec2_utils_sample"
  spec.version       = Ec2UtilsSample::VERSION
  spec.authors       = ["miyaryj"]
  spec.email         = ["miya.ryj@gmail.com"]

  spec.summary       = "My EC2 utils sample"
  spec.description   = "This is my EC2 utils sample."
  spec.homepage      = "https://github.com/miyaryj/ec2-utils-sample"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "aws-sdk"
end
