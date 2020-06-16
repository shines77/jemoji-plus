# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jemoji_plus/version"

Gem::Specification.new do |spec|
  spec.name        = "jemoji-plus"
  spec.summary     = "Highly customized version emoji plugin for Jekyll"
  spec.version     = Jekyll::JemojiPlus::VERSION
  spec.authors     = ["shines77 and GitHub, Inc."]
  spec.email       = "gz_shines@msn.com"

  spec.homepage = "https://github.com/shines77/jemoji-plus"
  spec.licenses = ["MIT"]
  spec.files    = ["lib/jemoji_plus.rb"]

  spec.required_ruby_version = ">= 2.3.0"

  spec.add_dependency "gemoji", "~> 3.0"
  spec.add_dependency "html-pipeline", "~> 2.2"
  # spec.add_dependency "html-pipeline-plus", "~> 2.10.7"
  spec.add_dependency "jekyll", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-jekyll", "~> 0.4"
end
