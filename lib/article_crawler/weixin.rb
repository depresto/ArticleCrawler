module ArticleCrawler
  class Weixin < Base

    def initialize(*)
      super
    end

    def crawl
      result = crawl_article(@uri.to_s)
      to_docx(result[:title], result[:content])
    end

    def article_list?
      false
    end

    def crawl_article(link)
      article_page = open_page(link)

      article_section = article_page.css('#img-content')
      title = article_section.search('h2#activity-name').text.strip

      title_html = article_section.css('h2#activity-name').to_html
      content_html = article_section.css('#js_content > section').to_html
      content_html = content_html.gsub('data-src', 'src')

      content = %(
        #{title_html}
        #{content_html}
      )

      to_docx(title, content)
    end

  end
end
