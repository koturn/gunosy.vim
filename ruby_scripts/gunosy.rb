require 'pp'
require 'open-uri'
require 'nokogiri'

# スクレイピング先のURL
url = 'https://gunosy.com/categories/7'

charset = nil 
html = open(url) do |f| 
  charset = f.charset 
  f.read 
end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

# タイトルを表示
doc.xpath('html/body/div/div/div/div/ul/li/div/dl/dt/a').each do |node|
  pp node[:href]
  pp node.text
end

