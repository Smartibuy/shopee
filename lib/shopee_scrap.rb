require 'oga'
require 'open-uri'
require 'json'


module ShopeeTileScrape
  class ShopeeTile

    URL = 'http://mall.shopee.tw/?utm_source=OrganicA&utm_medium=OrganicA&utm_campaign=lp_home_mall'
    XPATH_CARD = "//div[(@class='title')]"
    CARD_TITLE_XPATH = "//div[(@class='list-wrapper')]"

    def initialize
      parse_html
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
end
