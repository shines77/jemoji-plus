# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jemoji_plus/version"

Gem::Specification.new do |s|
  s.name        = "jemoji-plus"
  s.summary     = "Highly customized version emoji plugin for Jekyll"
  s.version     = Jekyll::Jemoji_Plus::VERSION
  s.authors     = ["shines77 and GitHub, Inc."]
  s.email       = "gz_shines@msn.com"

  s.homepage = "https://github.com/shines77/jemoji-plus"
  s.licenses = ["MIT"]
  s.files    = ["lib/jemoji_plus.rb"]

  s.required_ruby_version = ">= 2.3.0"

  s.add_dependency "gemoji", "~> 3.0"
  s.add_dependency "html-pipeline", "~> 2.2"
  # s.add_dependency "html-pipeline-plus", "~> 2.10.7"
  s.add_dependency "jekyll", "~> 3.0"

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake", "~> 12.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rubocop-jekyll", "~> 0.4"
end
