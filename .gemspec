# -*- encoding: utf-8 -*-
require 'rubygems' unless Object.const_defined?(:Gem)
require File.dirname(__FILE__) + "/lib/ripl/debug"
 
Gem::Specification.new do |s|
  s.name        = "ripl-debug"
  s.version     = Ripl::Debug::VERSION
  s.authors     = ["Gabriel Horner"]
  s.email       = "gabriel.horner@gmail.com"
  s.homepage    = "http://github.com/cldwalker/ripl-debug"
  s.summary = "A ripl plugin that automatically passes a failed eval to ruby-debug"
  s.description =  "This ripl plugin automatically starts the debugger whenever an evaled input throws an exception. The debugger is started at the source of the exception."
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = 'tagaholic'
  s.executables = ['ripl-debug']
  s.add_dependency 'ripl', '>= 0.2.7'
  s.add_dependency 'ruby-debug'
  s.files = Dir.glob(%w[{lib,test}/**/*.rb bin/* [A-Z]*.{txt,rdoc} ext/**/*.{rb,c} **/deps.rip]) + %w{Rakefile .gemspec}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE.txt"]
  s.license = 'MIT'
end
