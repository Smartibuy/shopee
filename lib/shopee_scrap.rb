require 'oga'
require 'open-uri'
require 'json'


module ShopeeTileScrape
  class ShopeeTile

    URL = 'http://www.mobile01.com/mpindex.php'
    CARD_CAT_XPATH = "//div[(@class='cate-list')]"
    XPATH_CARD = "//dl[(@class='cl-item')]"


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
      @document.xpath(CARD_CAT_XPATH).map do |card|
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
      result.to_json.split("\\n")
    end
  end
end
