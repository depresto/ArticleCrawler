module Crawler
  class Kaiyodo < Base

    def initialize(*)
      super
    end

    private

    def article_list
      @page.css('.boxNews_wrapper .boxMain ul.lists li')
    end

    def next_page_link
      @page.css('#container .navigation ol.wp-paginate li a.next').attr('href')
    end

    def crawl_article(article_link)
      article_page = open_page(article_link)

      article_section = article_page.css('#container #page_content')
      title = article_section.css('.entry_title').text

      title_html = article_section.css('.entry_title').to_html
      content_html = article_section.css('.entry_body').to_html

      content = %(
        <html>
          <head></head>
          <body>
          #{title_html}
          #{content_html}
          </body>
        </html>
      )

      to_docx(title, content)
    end
  end
end
