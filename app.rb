require 'uri'
require 'nokogiri'
require 'open-uri'
require './lib/crawler.rb'
Dir['./lib/**/*.rb'].each {|file| require file }

crawler = Crawler['http://kaiyodo.co.jp/k-blog/']
crawler.crawl