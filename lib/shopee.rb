require 'oga'
require 'open-uri'
require 'json'
require 'fuzzystringmatch'

module ShopeeScrape
  class ShopeeListGoodsByCate

    require_relative './data/mobile_category'
    GOOD_NAME = "//div[contains(@class, 'subject')]"
    GOOD_PRICE = "//div[contains(@class, 'price')]"
    GOOD_NUM = "//div[contains(@class, 'num')]"
    GOOD_UPTIME = "//div[contains(@class, 'updated')]"

    def initialize(category)
      parse_html(category)
    end

    def goods
      @goods ||= extract_goods
    end

    def search_keyword(good, keyword)
      @similar ||= find_similiar_goods(goods, keyword)
    end

    private

    def parse_html(id)
      url = ALL_LINK[id]
      @document = Oga.parse_html(open(url))
    end

    def extract_goods
      name = []
      price = []
      num = []
      update_time = []
      @document.xpath(GOOD_NAME).map do |good|
        name << good.text
      end

      @document.xpath(GOOD_PRICE).map do |good|
        price << good.text
      end

      @document.xpath(GOOD_NUM).map do |good|
        num << good.text
      end

      @document.xpath(GOOD_UPTIME).map do |good|
        update_time << good.text
      end

      number = name.length
      results = []
      # puts number
      if number > 32
        number = 32
      end
      for i in 2..number-1
        element = {}
        element['name'] = name[i]
        element['price'] = price[i]
        element['num'] = num[i]
        element['update_time'] = update_time[i]
        results << element
      end

      results
    end

    def find_similiar_goods(goods, keyword)
      jarow = FuzzyStringMatch::JaroWinkler.create( :native )
      rank = {}
      goods.each do |good|
        good_name = good['name']
        value = jarow.getDistance(good_name ,keyword)
        rank[good_name] = value
      end

      rank_after_sort = Hash[rank.sort_by{|k, v| v}.reverse]
      key = rank_after_sort.keys()
      results = []
      for i in 0..2
        good_name = key[i]
        goods.each do |good|
          if good['name'] == good_name
            results << good
            break
          end
        end
      end

      results

    end
  end



  # =============================
  # List all category of mobile01
  # =============================
  class ShopeeListAll
      require_relative './data/mobile_category'

      def initialize
          @cate_name = ALL_LINK
      end

      def get_categories
          @titles ||= extract_json
      end

      private

      def extract_json
           list = @cate_name.keys()
      end
  end

end
