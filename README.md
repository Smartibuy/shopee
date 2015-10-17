# Ideate-and-Scrape 

[![Build Status](https://travis-ci.org/Smartibuy/ideate-and-scrape.svg?branch=master)](https://travis-ci.org/Smartibuy/ideate-and-scrape)
[![Gem Version](https://badge.fury.io/rb/shopee.svg)](https://badge.fury.io/rb/shopee)

## Description

Parse Category from  [Shopee](http://shopee.tw/mobile/)

### Installation
- Install packages
```
$ gem install shopee
```

- Run
```
$ shopee_titles
```

- Usage
```ruby
require 'shopee_scrap'
scraper = ShopeeTileScrape::ShopeeTile.new
category_arr = JSON.parse(scraper.titles)

category_arr.each do |hash|
  puts "#{hash['title']} "
end
```

- Expected output
```
女生衣著 
男生衣著 
女生包包與配件 
男生包包與配件 
女鞋 
男鞋 
3C相關 
手機平板與周邊 
居家生活 
娛樂、收藏 
代買代購 
服務、票券 
化妝、保養品 
嬰幼童與母親 
美食、伴手禮 
寵物 
戶外、運動 
家電影音 
電玩遊戲相關 
其他類別 
```

## License

![](https://img.shields.io/packagist/l/doctrine/orm.svg)
