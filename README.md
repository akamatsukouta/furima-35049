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
|post_code  | string | null: false   |
|prefecture | string | null: false    |
|city       | string | null: false    |
|address    | string | null: false    |
|building_name   | string | 　　　　　   |
|phone_number    | string | null: false |

### Association
- belongs_to : user



## items  テーブル(商品)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false   |
| price     | integer | null: false   |
| explanation| text | null: false   |
| product_status＿id   | integer| null: false  foreign_key: true  |
| Shipping charge_id  | integer | null: false, foreign_key: true |
| Shipping area_id| integer | null: false, foreign_key: true    |
| Days to idea_id| integer | null: false, foreign_key: true   |
| Category_id　　　| integer | null: false, foreign_key: true    |
|user_id       | integer| null: false, foreign_key: true|

### Association
- belongs_to : user

- belongs_to : brand



##　Purchase management(購入管理)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id | integer | null: false, foreign_key: true     |
| product_id| integer | null: false ,foreign_key: true   |

### Association

- has_many : users




## brand テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     |string  | null: false   |

### Association
- has_many : products

