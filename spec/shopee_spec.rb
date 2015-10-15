require 'minitest/autorun'
require_relative '../lib/shopee_scrap'
require 'json'

CATEGORY_LIST = ['女生衣著', '男生衣著', '配件', '鞋子', '3C相關', '手機平板與周邊', '居家生活',
'娛樂生活', '代買代購', '服務、票券', '美妝、保養品', '嬰幼童與母親', '美食、伴手禮', '家電影音',
'電玩遊戲相關', '其他類別']

describe 'Shopee scrap testament' do
  it 'should return an array of string and name of categories' do
    TESTAMENT_ARR = []
    
    CATEGORY_LIST.each do |e|
        TESTAMENT_ARR.push({'title' => e})
    end
    
    scraper = ShopeeTileScrape::ShopeeTile.new
    category_arr = JSON.parse(scraper.titles)
    category_arr.must_equal TESTAMENT_ARR
  end
end
