require 'uri'
require 'nokogiri'
require 'open-uri'
require 'article_crawler'
Dir['./lib/**/*.rb'].each {|file| require file }

# crawler = Crawler['http://bandaicandy.hateblo.jp/archive']
# crawler = Crawler['http://kaiyodo.co.jp/k-blog/']
crawler = ArticleCrawler['https://mp.weixin.qq.com/s/v95X2diOOMU3bTiWtHiD1g']
crawler.crawl