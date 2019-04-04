Gem::Specification.new do |s|
  s.name        = 'article_crawler'
  s.version     = '0.0.1'
  s.date        = '2019-04-02'
  s.summary     = 'Article auto crawler'
  s.description = 'A crawler that can crawl Weixin and some WordPress sites'
  s.authors     = ['Wen-Hong Huang']
  s.email       = 'wayne@norikaoda.com'
  s.files       = Dir.glob('lib/**/*') + %w[README.md]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license     = 'MIT'
  s.add_runtime_dependency 'mini_magick', '~> 4.9'
  s.add_runtime_dependency 'nokogiri', '~> 1.10'
  s.add_runtime_dependency 'pandoc-ruby', '~> 2.0'
  s.add_runtime_dependency 'spreadsheet', '~> 1.2'
end
