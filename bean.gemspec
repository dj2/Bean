# -*- encoding: utf-8 -*-
$:.push File.expand_path("./lib")
require 'bean/version'

Gem::Specification.new do |s|
  s.name = 'bean'
  s.version = Bean::VERSION
  s.platform = Gem::Platform::RUBY

  s.authors = ['dan sinclair']
  s.email = ['dj2@everburning.com']

  s.homepage = 'http://github.com/dj2/Bean'
  s.summary = 'Cocoa Additions for MacRuby Applications'
  s.description = s.summary

  s.required_ruby_version = '>=1.9.2'

  s.add_development_dependency 'yard'

  s.files = `git ls-files`.split("\n")
  s.require_paths = ['lib']
end
