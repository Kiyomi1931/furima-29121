## table設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false|
|password|string|null:false|
|password-confirmation|string|null:false|
|last-name|string|null:false|
|first-name|string|null:false|
|last-name-kana|string|null:false|
|first-name-kana|string|null:false|

### Association

- has_many :items
- has_many :buys

##  itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item[image]|不明|null:false|
|item[name]|string|null:false|
|item[info]|string|null:false|
|item[category_id]|integer|null:false|
|item[sales_status_id]|integer|null:false|
|items[prefecture_id]|integer|null:false|
|items[scheduled_delivery_id]|integer|null:false|
|item[price]|integer|null:false|

- belongs_to :users
- has_one :buys

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null:false|
|prefecture|integer|null:false|
|city|string|null:false|
|addresses|string|null:false|
|building|string|

- belongs_to :buys

## buysテーブル

|Column|Type|Options|
|------|----|-------|
|buy_item-img|不明|foreign_key: true|
|buy-item-text|string|foreign_key: true|
|buy-item-price|integer|foreign_key: true|

- belongs_to :users
- belongs_to :items
- has_one :addresses