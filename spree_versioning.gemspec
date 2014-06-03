# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_versioning'
  s.version     = '2.2.1'
  s.summary     = 'Add versioning to your Spree models'
  s.description = 'This extension is a thin wrapper around the PaperTrail gem. It supports auditing and versioning of all Spree models out of the box. The set of models to track can also be easily customized if versioning of only a subset is desired.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Nicholas Hippenmeyer'
  s.email     = 'nicholashippenmeyer@gmail.com'
  s.homepage  = 'http://github.com/nhippenmeyer'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree', '~> 2.2.1'
  s.add_dependency 'paper_trail', '~> 3.0.1'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
