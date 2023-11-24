require_relative 'lib/steg_tools/steg_tools'

Gem::Specification.new do |s|
  s.name        = "StegTool"
  s.version     = StegTools::VERSION
  s.summary     = "A stegano tool for CTFs"
  s.description = "This tool helps you to automate flag searching in files"
  s.authors     = ["Ibrahim LY"]
  s.email       = "ibrahimly.il.il@gmail.com"
  s.files       = `git ls-files`.split("\n")
  s.homepage    =
    "https://rubygems.org/gems/steg_tool"
  s.license       = "MIT"

  s.add_dependency 'safe_shell'
end