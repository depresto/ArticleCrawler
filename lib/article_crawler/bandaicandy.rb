module ArticleCrawler
  class Bandaicandy < Base

    def initialize(*)
      super
    end

    def article_list
      @page.css('#main #main-inner .archive-entries section')
    end

    def article_link(article)
      article.css('a.entry-title-link').attr('href').text
    end

    def next_page_link
      @page.css('#main .pager .pager-next a').attr('href')
    end

    def crawl_article
      article_page = @page

      article_section = article_page.css('#container #main-inner article.entry')
      article_section.search('.entry-content > .entry-content').remove
      @title = article_section.css('h1.entry-title a').text

      title_html = article_section.css('h1.entry-title').to_html
      content_html = article_section.css('.entry-content').to_html

      @content = %(
        #{title_html}
        #{content_html}
      )
    end
  end
end
