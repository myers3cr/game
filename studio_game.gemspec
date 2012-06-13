Gem::Specification.new do |s| 
  s.name         = "cr_studio_game"
  s.version      = "1.0.0"
  s.author       = "C.R. Myers"
  s.email        = "myers3.cr@gmail.com"
  s.homepage     = "http://www.crmyers3.com"
  s.summary      = "Game from Pragmatic Studio"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end