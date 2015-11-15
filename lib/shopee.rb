require 'oga'
require 'open-uri'
require 'json'

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

    private

    def parse_html(id)
      # cate_list = ALL_LINK.keys()
      # category = cate_list[Integer(id)]
      url = ALL_LINK[id]
      @document = Oga.parse_html(open(url))
    end

    def extract_goods
      name = []
      price = []
      num = []
      update_time = []
      @document.xpath(GOOD_NAME).map do |good|
        #puts good.text
        name << good.text
      end

      @document.xpath(GOOD_PRICE).map do |good|
        #puts good.text
        price << good.text
      end

      @document.xpath(GOOD_NUM).map do |good|
        #puts good.text
        num << good.text
      end

      @document.xpath(GOOD_UPTIME).map do |good|
        #puts good.text
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
