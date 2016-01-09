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
## 1. List all categories of market of Mobile01
$ shopee allcate

## 2. List goods by a category
$ shopee list [category_name] [page_number]

## 3. Find top number goods in a category by the keyword
$ shopee search [category_name] [keyword] [number_of_product]

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


**2. List goods by a category**
```ruby
require 'shopee'
##Example ：category is '電腦資訊'
category_name = '電腦資訊'
page = 1
shopeecate = ShopeeScrape::ShopeeListGoodsByCate.new(category_name, page)
puts shopeecate.goods
```

- Expected output
```

##Example ： category is '電腦資訊'

{"name"=>"CM STORM SIRUS-C 天狼星 耳機麥克風  瞳(冰心淚) (60)　商品所在地:台北市", "price"=>"  3,500元", "num"=>"4", "update_time"=>"2015-11-15"}
{"name"=>"極新 Intel 535系列 240G  M.2 SATA  zounglun (14)　商品所在地:台北市", "price"=>"  7,500元", "num"=>"9", "update_time"=>"2015-11-15"}
{"name"=>"iPad mini2 16G 4G版 太空灰  夢幻之尊1 (7)　商品所在地:新竹市", "price"=>"  9,500元", "num"=>"3", "update_time"=>"2015-11-15"}
{"name"=>"IPad air 16G LTE  timleetw1 (50)　商品所在地:新北市", "price"=>"  11,000元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"Sony平版 Z3 Tablet Compacth LTE sim卡  by670917 (26)　商品所在地:基隆市", "price"=>"3,550元  4,000元", "num"=>"2", "update_time"=>"2015-11-15"}
{"name"=>"ASUS MB169B+ 外接式螢幕 ( 15.6 \")  angel660209 (0)　商品所在地:新北市", "price"=>"  25,000元", "num"=>"1", "update_time"=>"2015-11-15"}
{"name"=>"2011 Apple MacBook Pro 13吋 /i5/16G/878GB  hl_hl (5)　商品所在地:新北市", "price"=>"  12,000元", "num"=>"3", "update_time"=>"2015-11-15"}
{"name"=>"iPad Air Wi-Fi + Cellular(4G/LTE) 32GB 銀色  setry (1)　商品所在地:台北市", "price"=>"  38,000元", "num"=>"2", "update_time"=>"2015-11-15"}
{"name"=>"全新未拆  Macbook Pro Retina i5 2.7GHz/8G/128/2015年新款  daniel6060 (37)　商品所在地:台北市", "price"=>"  13,990元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"SONY I5四核心執行續+8G大容量記憶體+獨顯1G+硬碟500G+藍光機+原廠充電器  安康-Mr.詹 (1)　商品所在地:新北市　(可交換商品)", "price"=>"  19,500元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"104年7月購入 Surface 3 4gRam 128gRom 已貼玻璃貼附紅色鍵盤+觸控筆  baggio (25)　商品所在地:台北市", "price"=>"  1,700元", "num"=>"3", "update_time"=>"2015-11-15"}
{"name"=>"優派ViewSonic 19吋 VA1938wa-LED背光液晶  perryhsiao198... (1)　商品所在地:台北市", "price"=>"47,000元  48,800元", "num"=>"1", "update_time"=>"2015-11-15"}
{"name"=>"UX501JW-0352A4720HQ 512G SSD最高階版本  劉羿呈 (0)　商品所在地:新北市", "price"=>"  1,100元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"電腦主機+Benq螢幕『內含系統與Office/適合小朋友使用  安康-Mr.詹 (1)　商品所在地:新北市　(可交換商品)", "price"=>"20,000元  21,000元", "num"=>"8", "update_time"=>"2015-11-15"}
{"name"=>"Lenovo T530 i7-3630QM真四核筆電  Rainbowsky (28)　商品所在地:宜蘭縣　(可交換商品)", "price"=>"  7,700元", "num"=>"2", "update_time"=>"2015-11-15"}
{"name"=>"Acer 4743G I5-520M/Win10/4G/SSD+320G HDD/GT540M獨顯/14...  a82820a (9)　商品所在地:台北市", "price"=>"  80元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"APPLE 蘋果 筆記型電腦 鍵盤膜 MacBook Air Pro 13.3吋 15.4吋 超薄 TP...  gf0902 (10)　商品所在地:台中市", "price"=>"  80元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"APPLE 蘋果 筆記型電腦 鍵盤膜 MacBook Air Pro 11 超薄 TPU保護膜  gf0902 (10)　商品所在地:台中市", "price"=>"500元  1,000元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"超誇張100元起 D-Link友訊 DIR-820L 802.11ac AC1200 雙頻無線路由器  o680680o (3)　商品所在地:新北市", "price"=>"4,700元  9,000元", "num"=>"2", "update_time"=>"2015-11-15"}
{"name"=>"Lenovo Yoga Table2  小海龜 (52)　商品所在地:桃園市", "price"=>"  15,000元", "num"=>"1", "update_time"=>"2015-11-15"}
{"name"=>"【手機玩家】IPHONE6 16G金外觀約九成新保固至2016-7月  Anycall0314 (49)　商品所在地:新竹市", "price"=>"  6,000元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"1U 機架型ATOM主機 雙LAN  kahnmao (60)　商品所在地:新北市", "price"=>"20,000元  25,000元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"2013年中 13吋 Macbook air [A1466]  wpchang (0)　商品所在地:台北市　(可交換商品)", "price"=>"  6,200元", "num"=>"1", "update_time"=>"2015-11-15"}
{"name"=>"極新保固中ASUS RT-AC87U AC2400華碩雙頻無線路由器(2.4/5GHz)  cham3130n (1)　商品所在地:台北市", "price"=>"  12,000元", "num"=>"3", "update_time"=>"2015-11-15"}
{"name"=>"Surface Pro 1 鍵盤、觸控筆  dih0512 (6)　商品所在地:桃園市　(可交換商品)", "price"=>"  50元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"(11/15到貨) 創見 DDR 400 1G 桌上型記憶體 功能正常良品 $50元/1支  QQ\"嘿 (71)　商品所在地:桃園市", "price"=>"5,500元  6,000元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"賣99.99新黑色ASUS MeMO Pad 7 (ME572CL) 2GB/16GB LTE  星空下的雨 (31)　商品所在地:新北市　(可交換商品)", "price"=>"  10,500元", "num"=>"2", "update_time"=>"2015-11-15"}
{"name"=>"Synology DS1511+ 5 bay 專為中小型企業設計的高效能 NAS 伺服器  dg4838 (13)　商品所在地:台北市", "price"=>"  2,700元", "num"=>"2", "update_time"=>"2015-11-15"}
{"name"=>"全新未拆 羅技MX Master  fervidity (5)　商品所在地:台中市　(可交換商品)", "price"=>"9,500元  10,000元", "num"=>"0", "update_time"=>"2015-11-15"}
{"name"=>"賣 99.99 新Samsung Galaxy Tab S 8.4 白3G/16G LTE ( 可通話平...  星空下的雨 (31)　商品所在地:新北市　(可交換商品)", "price"=>nil, "num"=>nil, "update_time"=>nil}
```
**3. Find top num goods in a category by the keyword**
```ruby
require 'shopee'
##Example ：category is '電腦資訊'; keyword is 'samsung'
shopeecate = ShopeeScrape::ShopeeListGoodsByCate.new()
puts shopeecate.search_keyword('電腦資訊', 'Asus', '10')
```
- Expected output
```
{"name"=>"Samsung GALAXY Tab4 7.0 LTE (未拆封) 只接受面交 價格可再議  schumark (0)　商品所在地:台中市", "price"=>"  5,800元", "num"=>"0", "update_time"=>"2015-11-16"}
{"name"=>"賣 99.99 新Samsung Galaxy Tab S 8.4 白3G/16G LTE ( 可通話平...  星空下的雨 (31)　商品所在地:新北市　(可交換商品)", "price"=>"  1,000元", "num"=>"4", "update_time"=>"2015-11-16"}
{"name"=>"Samsung Tab S 8.4 WIFI 黑金 極新無傷 保固至明年4月 附購買證明 s2.mini...  153013 (11)　商品所在地:桃園市　(可交換商品)", "price"=>"  4,600元", "num"=>"1", "update_time"=>"2015-11-16"}
```

## License

![](https://img.shields.io/packagist/l/doctrine/orm.svg)
