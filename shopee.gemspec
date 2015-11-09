$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'shopee/version'
Gem::Specification.new do |s|
  s.name = 'shopee'
  s.version = ShopeeScrape::VERSION
  s.date = ShopeeScrape::DATE
  s.executables << 'shopee'
  s.summary = 'Scrape categories of mobile01!'
  s.description = 'Scrape categories of mobile01!'
  s.authors = ['Sheng Jung Wu', 'Calvin Jeng', 'Henry Chang', 'Yi Wei Huang']
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files spec/*`.split("\n")
  s.homepage    =  'https://github.com/Smartibuy/shopee'
  s.license     =  'MIT'

  # depend gem
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_runtime_dependency 'oga'
  s.add_runtime_dependency 'json'
end
