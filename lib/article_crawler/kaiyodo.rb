module ArticleCrawler
  class Kaiyodo < Base

    def initialize(*)
      super
    end

    def article_list?
      true
    end

    def article_list
      @page.css('.boxNews_wrapper .boxMain ul.lists li')
    end

    def article_link(article)
      article.css('a').attr('href').text
    end

    def next_page_link
      @page.css('#container .navigation ol.wp-paginate li a.next').attr('href')
    end

    def crawl_article(link)
      article_page = open_page(link)

      article_section = article_page.css('#container #page_content')
      article_section.search('.wp_social_bookmarking_light').remove
      title = article_section.css('.entry_title').text

      title_html = article_section.css('.entry_title').to_html
      content_html = article_section.css('.entry_body').to_html

      content = %(
        #{title_html}
        #{content_html}
      )

      to_docx(title, content)
    end
  end
end
