require 'oga'
require 'open-uri'
require 'json'

module ShopeeScrape
  class ShopeeListGoods
    def initialize(category, page)
      @category = category
      @page = page
    end

    def titles
      @titles ||= extract_titles
    end

    private

    def parse_html
      url = "#{URL}"
      @document = Oga.parse_html(open(url))
    end

    def extract_titles
      result = []
      @document.xpath(CARD_TITLE_XPATH).map do |card|
        card.xpath(XPATH_CARD).map do |item|

          stri = item.text
          check =  stri.empty?
          if check == false
            element = {}
            element['title'] = item.text
            result << element
          end
        end
      end
      result.to_json
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
