# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname  | string | null: false    |
| email    | string | null: false, unique: true   |
| encrypted_password | string | null: false   |
|family_name | string | null: false   |
|family_name_kana   | string | null: false   |
|first_name  | string | null: false  |
|first_name_kana    | string | null: false   |
|birth_day   | date   | null: false   |

### Association
- has_many : products
- belongs_to : destination



## destination テーブル(宛先)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id  |integer | null: false, foreign_key: true |
|family_name| string | null: false   |
|family_name_kana | string | null: false    |
|first_name | string | null: false    |
|first_name_kana  | text   | null: false    |
|post_code  | string | null: false   |
|prefecture | string | null: false    |
|city       | string | null: false    |
|address    | string | null: false    |
|building_name   | string | null: false   |
|phone_number    | string |             |

### Association
- belongs_to : user



## product テーブル(商品)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false   |
| price     | integer | null: false   |
| explanation| text | null: false   |
| product_status    | string | null: false   |
| Shipping charges  | string | null: false    |
| Shipping area| string | null: false   |
| Days to idea| string | null: false   |
| Category　　　| string | null: false    |
|user_id       | integer| null: false, foreign_key: true|

### Association
- belongs_to : user

- belongs_to : brand



##　Purchase management(購入管理)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| purchase_id | string | null: false    |
| purchase_date| string | null: false   |
| buyer_id | string | null: false   |
| quantity | string | null: false   |

###




## brand テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     |string  | null: false   |

### Association
- has_many : products

