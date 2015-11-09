require 'minitest/autorun'
require 'webmock/minitest'
require 'json'
require_relative '../lib/shopee'
require_relative './vcr'

CATEGORY_LIST = ['電腦資訊', '手持通訊', '攝影器材', '數位家電', '休閒娛樂', '生活','汽車', '機車', '自行車',
'男性時尚', '女性流行', '代購', '房產']

TESTAMENT_ARR = []

CATEGORY_LIST.each do |e|
  TESTAMENT_ARR.push({'title' => e})
end

VCR.use_cassette('shopee') do
  scraper = ShopeeTileScrape::ShopeeTile.new
  describe 'Shopee testament using vcr' do
    it 'should return an array of string and name of categories' do
      category_arr = JSON.parse(scraper.titles)
      category_arr.must_equal TESTAMENT_ARR
    end
  end
end
