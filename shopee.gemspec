$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'shopee/version'
Gem::Specification.new do |s|
  s.name = 'shopee'
  s.version = ShopeeTileScrape::VERSION
  s.date = ShopeeTileScrape::DATE
  s.executables << 'shopee_titles'
  s.summary = 'Scrape categories of shopee!'
  s.description = 'Scrape categories of shopee!'
  s.authors = ['Sheng Jung Wu', 'Calvin Jeng', 'Henry Chang', 'Yi Wei Huang']
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files spec/*`.split("\n")
  s.homepage    =  'https://github.com/Smartibuy/ideate-and-scrape'
  s.license     =  'MIT'

  # depend gem
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_runtime_dependency 'oga'
  s.add_runtime_dependency 'json'
end