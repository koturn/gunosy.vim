#about
* グノシーwebサイトからテクノロジー分野の目次をVimで見る
* OSx 10.10でテスト済み
* rubyスクリプトのpathがイマイチわかんないので調節してください。

#install
* ruby 2.0.0をinstall
* sudo gem install nokogiriする
* 自由ですが
* 以下のようにしてurlの上でgxするとブラウザopenするようにすると便利かも 
<pre>
NeoBundle 'tyru/open-browser.vim'
nmap gx <Plug>(openbrowser-smart-search)
</pre>


#using
<pre>
:GetGunosy
</pre>
