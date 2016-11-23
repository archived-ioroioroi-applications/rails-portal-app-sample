# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
# モジュール Scraper 作成
module Scraper
  # Get and parse html from atpworldtour.com
  class Html
    def self.get(uri) # 呼び出された際の引数のURLのHTMLソースを出力. ex = Scraper::Html.get(http://www.gizmodo.jp/) => ex = {<sourx code>, chaset}
      charset = nil
      html = open(uri) do |f|
        charset = f.charset # 文字種別を取得. utf-8などが変数charsetに格納される.
        f.read  # htmlを読み込んで変数htmlに渡す
      end
      { html: html, charset: charset }
    end

    def self.parse(html, charset)
      # ノコギリを使ってhtmlを解析できる形に整形
      Nokogiri::HTML.parse(html, charset)
    end
  end
end
