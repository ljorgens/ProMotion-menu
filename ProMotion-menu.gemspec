require File.expand_path('../lib/ProMotion/menu/version.rb', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'ProMotion-menu'
  s.version       = ProMotion::Menu::VERSION
  s.authors       = ["Matt Brewer", "Ryan Linton", "Jamon Holmgren"]
  s.email         = ['matt.brewer@me.com', 'ryanl@clearsightstudio.com', 'jamon@clearsightstudio.com']

  s.summary       = "Provides a facebook/Path style slide menu for ProMotion RubyMotion apps."
  s.description   = "ProMotion DSL integration with MMDrawerController cocoapod providing a left and/or right 'slide' out menu complete with gestures for reveal/hide."

  s.homepage      = "https://github.com/clearsightstudio/ProMotion-menu"
  s.files         = Dir["lib/**/*"] + ["README.md"]
  s.test_files    = Dir["spec/**/*"]
  s.require_paths = ['lib']
  s.license       = "MIT"

  s.add_dependency "motion-cocoapods", "~> 1"
  s.add_dependency "ProMotion", "~> 3"

  s.add_development_dependency "rake", "~> 12"
  s.add_development_dependency "motion-stump", "~> 0.3"

end
