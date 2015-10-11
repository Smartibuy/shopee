require 'oga'
require 'open-uri'
require 'json'


module NewsTileScrape
  class NewsTile

    URL = 'https://news.google.com.tw'
    XPATH_CARD = "//div[contains(@class, 'basic-title')]"
    CARD_TITLE_XPATH = './/span'

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
      @document.xpath(XPATH_CARD).map do |card|
        element = {}
        element['title'] = card.xpath(CARD_TITLE_XPATH).text
        result << element
      end
      result.to_json
    end
  end
end
