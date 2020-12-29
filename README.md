## table設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false|
|encrypted_password|string|null:false|
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_kana|string|null:false|
|first_name_kana|string|null:false|
|user_birth_date|date|null:false|

### Association

- has_many :items
- has_many :buys

##  itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|info|text|null:false|
|category_id|integer|null:false|
|sales_status_id|integer|null:false|
｜shipping_fee_status_id｜integer|null:false|
|prefecture_id|integer|null:false|
|scheduled_delivery_id|integer|null:false|
|price|integer|null:false|
|user_id|integer|foreign_key: true|

- belongs_to :user
- has_one :buy

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null:false|
|prefecture_id|integer|null:false|
|city|string|null:false|
|addresses|string|null:false|
|building|string|
|phone_number|string|null:false|

- belongs_to :buy

## buysテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
item_id|integer|null:false|
|address_id|integer|foreign_key: true|
|buy_item_text|string|foreign_key: true|
|buy_item_price|integer|foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one :address