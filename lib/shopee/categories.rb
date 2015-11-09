require 'oga'
require 'open-uri'
require 'json'
require_relative '../data/mobile_category'

module ShopeeCategory
    class ShopeeName

        def initialize
            parse_cate
        end

        def get_categories
            @titles ||= extract_json
        end

        private

        def parse_cate
            @cate_name = ALL_LINK
        end



        def extract_json
            list = @cate_name.keys()
        end

    end
end
