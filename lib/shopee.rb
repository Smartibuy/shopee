require 'oga'
require 'open-uri'
require 'json'
require 'fuzzystringmatch'

module ShopeeScrape

  # =============================
  # Class For List products by category and search products with keyword
  # =============================
  class ShopeeListGoodsByCate

    require_relative './data/mobile_category'
    GOOD_INFO = "//div[contains(@class, 'img')]"
    GOOD_NAME = "//div[contains(@class, 'subject')]"
    GOOD_PRICE = "//div[contains(@class, 'price')]"
    GOOD_NUM = "//div[contains(@class, 'num')]"
    GOOD_UPTIME = "//div[contains(@class, 'updated')]"

    def initialize(category=nil, page=nil)
      if !category.nil? && !page.nil?
        get_page_html(category, page)
      end
    end

    def goods
      @goods ||= extract_goods
    end

    def search_keyword(category, keyword, list_num)
      @similar ||= find_similiar_goods(category, keyword, list_num)
    end

    def get_cate_childs(cate=nil)
      childs = []
      if !cate.nil?
        CATE_TREE[cate].each do |k, v|
          childs << {k => v}
        end
        childs
      else
        childs
      end
    end

    private

    def get_page_html(cate, page)
      @document = []
      url = ALL_LINK[cate]

      if page != 1
        @document << Oga.parse_html(open(url << '&p=' << page.to_s))
      else
        @document << Oga.parse_html(open(url))
      end

    end

    def extract_goods
      results = []

      @document.each do |doc|
        name = []
        price = []
        num = []
        update_time = []
        pic = []
        link = []

        doc.xpath(GOOD_NAME).map do |good|
          name << good.text
        end

        doc.xpath(GOOD_PRICE).map do |good|
          price << good.text
        end

        doc.xpath(GOOD_NUM).map do |good|
          num << good.text
        end

        doc.xpath(GOOD_UPTIME).map do |good|
          update_time << good.text
        end

        doc.xpath(GOOD_INFO).map do |good|
          link << good.css('a').attribute('href')[0].to_s
          pic << good.css('img').attribute('src')[0].to_s
        end

        number = name.length

        # puts number
        if number > 32
          number = 32
        end

        for i in 2..number-1
          element = {}
          element['name'] = name[i]
          element['price'] = price[i-1]
          element['num'] = num[i-1]
          element['update_time'] = update_time[i-1]
          element['link'] = link[i]
          element['pic'] = pic[i]
          results << element
        end

      end

      results
    end

    def find_similiar_goods(category, keyword, list_num)
      goods = []
      goodsSet = []

      for i in 1..5
        shopeecate = ShopeeScrape::ShopeeListGoodsByCate.new(category, i)
        goodsSet << shopeecate.goods
      end

      goodsSet.each do |good|
        good.each do |g|
          goods << g
        end
      end

      jarow = FuzzyStringMatch::JaroWinkler.create( :native )
      rank = {}

      goods.each do |good|
        value = jarow.getDistance(good['name'] ,keyword)
        rank[good['name']] = value
      end

      rank_after_sort = Hash[rank.sort_by{|k, v| v}.reverse]
      key = rank_after_sort.keys()
      results = []
      for i in 0..list_num.to_i - 1
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
