# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "ec2-copy-snapshot"
  gem.version       = "0.1.0"
  gem.authors       = ["Zach Wily"]
  gem.email         = ["zach@zwily.com"]
  gem.description   = %q{Script to copy an EC2 snapshot between regions}
  gem.summary       = %q{Script to copy an EC2 snapshot between regions}
  gem.homepage      = "https://github.com/zwily/ec2-copy-snapshot"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('aws-sdk')
  gem.add_dependency('net-ssh')
end
