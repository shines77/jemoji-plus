# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-emoji/version"

Gem::Specification.new do |s|
  s.name        = "jekyll-emoji"
  s.summary     = "Highly customized version emoji plugin for Jekyll"
  s.version     = Jekyll::Jekyll_Emoji::VERSION
  s.authors     = ["shines77 and GitHub, Inc."]
  s.email       = "gz_shines@msn.com"

  s.homepage = "https://github.com/shines77/jekyll-emoji"
  s.licenses = ["MIT"]
  s.files    = ["lib/jekyll-emoji.rb"]

  s.required_ruby_version = ">= 2.3.0"

  s.add_dependency "gemoji", "~> 3.0"
  s.add_dependency "html-pipeline", "~> 2.2"
  s.add_dependency "jekyll", "~> 3.0"

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake", "~> 12.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rubocop-jekyll", "~> 0.4"
end
