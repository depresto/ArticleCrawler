require 'uri'
require 'nokogiri'
require 'open-uri'
require 'article_crawler'
Dir['./lib/**/*.rb'].each {|file| require file }

# crawler = ArticleCrawler['http://bandaicandy.hateblo.jp/archive']
crawler = ArticleCrawler['http://kaiyodo.co.jp/k-blog/']
# crawler = ArticleCrawler['http://kaiyodo.co.jp/k-blog/未分類/b=1083/']
# crawler = ArticleCrawler['https://mp.weixin.qq.com/s/v95X2diOOMU3bTiWtHiD1g']
p crawler.article_list?
p crawler.crawl_article_list
# crawler.crawl_article
# p crawler.title
