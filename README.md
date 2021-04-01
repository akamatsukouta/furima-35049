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
- has_many : purchase＿managements



## destination テーブル(宛先)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id  |integer | null: false, foreign_key: true |
|post_code  | string | null: false   |
|prefecture_id | integer | null: false  |
|city       | string | null: false    |
|address    | string | null: false    |
|building_name   | string |           |
|phone_number    | string | null: false |

### Association
- belongs_to : purchase＿management




## items  テーブル(商品)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false   |
| price     | integer | null: false   |
| explanation| text | null: false   |
| product_status＿id   | integer| null: false    |
| shipping_charge_id  | integer | null: false |
| shipping_area_id| integer | null: false  |
| days_to_idea_id| integer | null: false |
| category_id    | integer | null: false   |
|user_id       | integer| null: false, foreign_key: true|

### Association
- belongs_to : user
- has_one : purchase_management
- belongs_to : brand



## Purchase management(購入管理)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| management_id | integer | null: false, foreign_key: true     |
| items_id| integer | null: false ,foreign_key: true   |

### Association

- belongs_to : user
- belongs_to : item
- has_one : destination




## brand テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     |string  | null: false   |

### Association
- has_many : products

