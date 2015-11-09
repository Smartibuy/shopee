Shopee
==
Scrape informations from
- [Mobie01](http://www.mobile01.com) - [Exacted data](https://github.com/lockys/Mobile01-Ruten-Scraper/blob/master/output/mobile01-category)
- [Shopee](http://shopee.tw/mobile/) (depreciated)

[![Build Status](https://travis-ci.org/Smartibuy/shopee.svg?branch=master)](https://travis-ci.org/Smartibuy/shopee)
[![Gem Version](https://badge.fury.io/rb/shopee.svg)](https://badge.fury.io/rb/shopee)

Get started
==
### Install ruby gem!
```
$ gem install shopee
```

### Supported CLI
```
$ shopee show all-cate
```

### Usage
**1. List all categories of market of Mobile01**
```ruby
require 'shopee'
shopeecate = ShopeeScrape::ShopeeListAll.new
category_arr shopeecate.get_categories
category_arr.each do |e|
  puts e
end
```

- Expected output
```
電腦資訊
桌上型電腦
核心組件
儲存裝置
顯示設備
網路設備
電腦周邊設備
機殼、散熱與電源
電腦軟體與書籍
耗材、線材與雜項
筆記型電腦
筆記型電腦周邊
平板電腦
蘋果電腦
蘋果電腦周邊
其它
手持通訊
手機
Android
iPhone
Windows Phone
其他類型
手機配件與吊飾
家用電話
傳真、影印與事務機
通訊週邊與耗材
GPS
攝影器材
攝影機
傳統底片相機
消費級數位相機
數位單眼相機
相機其他周邊
相機鏡頭
攝影背包
數位相機電池
數位相機充電器
記憶卡與行動相簿
相片印表機與數位相框
數位家電
電視機
音響與隨身聽
影音設備周邊
投影機與布幕
生活小家電
廚房小家電
淨水設備
健康與美容小家電
冰箱
洗衣與乾衣機
冷氣空調
休閒娛樂
電玩主機
電玩遊戲
動漫電玩週邊
電腦與線上遊戲
懷舊童玩
遙控模型
金屬與鐵道模型
益智遊戲
玩具與模型
書籍雜誌
電視電影
音樂歌曲
生活用品
名產美食
運動健身綜合
休閒旅遊
鐘錶名品
生活居家
寵物用品
汽車
轎車、跑車
休旅車
貨車、其他車種
汽車用品
汽車精品
美容清潔
油品
其他汽車用品
影音設備
汽車零件
車燈
輪胎、鋁圈
底盤系統
電機、冷卻系統
煞車系統
空力套件
引擎、傳動與其它
機車
機車騎士用品
機車用品
機車零組件
自行車
公路車
登山車
小徑與摺疊車
休閒與通勤車
人身部品
安全帽
車衣、車褲
其它人身部品
自行車用品
車燈、碼表
收納袋、車袋
清潔保養用品
其它周邊配件
自行車零件
車架、前叉、避震器
龍頭、車把
煞車、變速系統零件
輪組、內外胎
座墊、座管
其它車用零件
男性時尚
服飾與襯衫
外套與夾克
男用長短褲
男用鞋與靴
男性內衣褲襪
男性飾品與配件
女性流行
彩妝與保養
嬰幼童與母親
流行女裝
女性飾品與配件
女鞋
女性內衣
代購與虛擬物品
3C物品代購
動漫電玩代購
服飾配件代購
其他物品代購
手機門號/加值/預付卡
遊戲點卡/虛寶
票卷
房屋地產
北部地區
中部地區
南部地區
東部與外島地區
```

## License

![](https://img.shields.io/packagist/l/doctrine/orm.svg)
