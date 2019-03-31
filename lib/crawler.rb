require 'uri'
require 'nokogiri'
require 'open-uri'
require 'pandoc-ruby'

module Crawler
  class << self
    def [](url)
      uri = URI(url)
      class_name = uri.host.split('.')[0].capitalize
      const_get(class_name).new uri, uri.host
    end
  end

  class Base
    def initialize(uri, hostname)
      @uri = uri

      @save_file_path = "./save/#{hostname}"
      system 'mkdir', '-p', @save_file_path
    end

    def crawl
      @page = Nokogiri::HTML(open(@uri.to_s))
      crawl_article_list
    end

    private

    def crawl_article_list
      article_list.each do |article|
        article_link = article.css('a').attr('href').text
        crawl_article(article_link)
      end

      return if next_page_link.nil?

      @page = open_page(next_page_link)
      crawl_article_list
    end

    def open_page(uri)
      Nokogiri::HTML(open(uri))
    end

    def article_list
      raise NotImplementedError
    end

    def next_page_link
      raise NotImplementedError
    end

    def crawl_article(_article)
      raise NotImplementedError
    end

    def to_docx(title, content)
      filepath = "#{@save_file_path}/#{title}.docx"
      print "Writing: #{filepath} ..."
      doc = PandocRuby.html(content).to_docx
      File.write(filepath, doc)
      print 'Done\n'
    end
  end
end
