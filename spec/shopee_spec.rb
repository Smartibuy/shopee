require 'minitest/autorun'
require 'webmock/minitest'
require 'json'
require_relative '../lib/shopee_scrap'
require_relative '../vcr/vcr.rb'

CATEGORY_LIST = ['女生衣著', '男生衣著', '女生包包與配件', '男生包包與配件', '女鞋', '男鞋','3C相關', '手機平板與周邊', '居家生活',
'娛樂、收藏', '代買代購', '服務、票券', '化妝、保養品', '嬰幼童與母親', '美食、伴手禮', '寵物', '戶外、運動',
'家電影音', '電玩遊戲相關', '其他類別']

TESTAMENT_ARR = []
    
CATEGORY_LIST.each do |e|
  TESTAMENT_ARR.push({'title' => e})
end

VCR.use_cassette('shopee', :record=>:once) do
  scraper = ShopeeTileScrape::ShopeeTile.new
  describe 'Shopee testament using vcr' do
    it 'should return an array of string and name of categories' do  
      category_arr = JSON.parse(scraper.titles)
      category_arr.must_equal TESTAMENT_ARR
    end
  end
end