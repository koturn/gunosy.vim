require 'open-uri'
require 'nokogiri'

# スクレイピング先のURL
URL = 'https://gunosy.com/categories/7'

charset = nil
html = open(URL) do |f|
  charset = f.charset
  f.read
end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)
# Vimのカレントバッファのオブジェクトを取得
vim_buffer = VIM::Buffer.current
# タイトルを表示
doc.xpath('html/body/div/div/div/div/ul/li/div/dl/dt/a').each do |node|
  vim_buffer.append(vim_buffer.count - 1, node[:href])
  vim_buffer.append(vim_buffer.count - 1, node.text)
end
