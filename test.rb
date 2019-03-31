require 'uri'
require 'nokogiri'
require 'open-uri'
require './lib/crawler.rb'
Dir['./lib/**/*.rb'].each {|file| require file }

# uri = URI("http://kaiyodo.co.jp/k-blog/")
# uri = URI("http://kaiyodo.co.jp/k-blog/page/4/")
# page = Nokogiri::HTML(open(uri.to_s))

# p page.css('.navigation .wp-paginate li .next').attr('src')

# article_list = page.css('.boxNews_wrapper .boxMain ul.lists li')
# article_list.each do |article|
#   article_link = article.css('a').attr('href').text
#   article_page = Nokogiri::HTML(open(article_link))

#   article_section = article_page.css('#container #page_content')
#   title = article_section.css('.entry_title').text
#   content = article_section.css('.entry_body').to_html

#   p title
#   p content
#   break
# end

crawler = Crawler['http://kaiyodo.co.jp/k-blog/']
crawler.crawl
