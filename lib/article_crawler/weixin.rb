module ArticleCrawler
  class Weixin < Base
    def initialize(*)
      super
    end

    def article_list?
      false
    end

    def crawl_article
      article_page = @page

      article_section = article_page.css('#img-content')
      @title = article_section.search('h2#activity-name').text.strip

      title_html = article_section.css('h2#activity-name').to_html
      content_html = article_section.css('#js_content > section').to_html
      content_html = content_html.gsub('data-src', 'src')

      @content = %(
        #{title_html}
        #{content_html}
      )
    end

  end
end
