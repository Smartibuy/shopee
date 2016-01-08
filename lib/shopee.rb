require 'oga'
require 'open-uri'
require 'json'
require 'fuzzystringmatch'

module ShopeeScrape
  class ShopeeListGoodsByCate

    require_relative './data/mobile_category'
    GOOD_INFO = "//div[contains(@class, 'img')]"
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

    def search_keyword(good, keyword, list_num)
      @similar ||= find_similiar_goods(goods, keyword, list_num)
    end

    private

    def parse_html(id)
      @document = []
      url = ALL_LINK[id]
      @document << Oga.parse_html(open(url))

      page_num = 2
      if CATEGORY_LIST.include?(id) == true
        page_num = 5
      end

      check = 1
      i = 1

      while check == 1 && i < page_num
        i += 1
        begin
          url_t = url +'&p='+i.to_s
          @document << Oga.parse_html(open(url_t))
        rescue
          check = 0
        end
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
          # puts good.css('img').attribute('src')[0].to_s
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
          element['price'] = price[i]
          element['num'] = num[i]
          element['update_time'] = update_time[i]
          element['link'] = link[i]
          element['pic'] = pic[i]
          results << element
        end

      end
      puts results.length
      results
    end

    def find_similiar_goods(goods, keyword, list_num)
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
