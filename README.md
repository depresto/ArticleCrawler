# 文章列表爬蟲 Blog Article Crawler (Serverless version)

### Description

爬文章列表，儲存所有部落格文章至 Docx 文件

Crawl article list to docx file

### Usage

```ruby
require 'article_crawler'

crawler = ArticleCrawler['https://mp.weixin.qq.com/s/v95X2diOOMU3bTiWtHiD1g']
if crawler.article_list? # True if is a article list page
  list = crawler.crawl_article_list
  list.each do |link|
    article = ArticleCrawler[link]
    article = article.crawl_article

    docx = article.to_docx
  end
else
  article = crawler.crawl_article
  docx = article.to_docx

  File.write('/path/to/file', docx)
end
```
