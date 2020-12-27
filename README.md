## table設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false|
|encrypted_password|string|null:false|
|last-name|string|null:false|
|first-name|string|null:false|
|last-name-kana|string|null:false|
|first-name-kana|string|null:false|
|user_birth_date１i|integer|null:false|
|user_birth_date2i)|integer|null:false|
|user_birth_date3i|integer|null:false|

### Association

- has_many :items
- has_many :buys

##  itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null:false|
|item_info|string|null:false|
|item_category_id|integer|null:false|
|item_sales_status_id|integer|null:false|
｜item_shipping_fee_status_id｜integer|null:false|
|items_prefecture_id|integer|null:false|
|items_scheduled_delivery_id|integer|null:false|
|item_price|integer|null:false|

- belongs_to :user
- has_one :buy

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null:false|
|prefecture|integer|null:false|
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
|buy_item_text|string|foreign_key: true|
|buy_item_price|integer|foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one :address