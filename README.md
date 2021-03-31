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
| nickname  | string | NOT NULL    |
| email    | string | NOT NULL    |
| password | string | NOT NULL    |
|user_image| string | NOT NULL    |
|introduction| text   | NOT NULL    |
|family_name | string | NOT NULL    |
|family_name_kana   | string | NOT NULL    |
|first_name  | string | NOT NULL    |
|first_name_kana    | string | NOT NULL    |
|birth_day   | date   | NOT NULL    |

### Association
- has_many : products
- belongs_to : destination



## destination テーブル(宛先)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id  |integer | NOT NULL, foreign_key: true |
|family_name| string | NOT NULL    |
|family_name_kana | string | NOT NULL    |
|first_name | string | NOT NULL    |
|first_name_kana  | text   | NOT NULL    |
|post_code  | string | NOT NULL    |
|prefecture | string | NOT NULL    |
|city       | string | NOT NULL    |
|address    | string | NOT NULL    |
|building_name   | string | NOT NULL    |
|phone_number    | string |             |

### Association
- belongs_to : user



## product テーブル(商品)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | NOT NULL    |
|price     | string | NOT NULL    |
|explanation| string | NOT NULL    |
|status    | string | NOT NULL    |
|size      | string | NOT NULL    |
|shipping_cost | string | NOT NULL    |
|shipping_days | string | NOT NULL    |
|prefecture_id | string | NOT NULL    |
|judgment      | string | NOT NULL    |
|category_id   | integer| NOT NULL, foreign_key: true|
|brand_id      | integer| NOT NULL, foreign_key: true|
|shipping_id   | integer| NOT NULL, foreign_key: true|
|user_id       | integer| NOT NULL, foreign_key: true|

### Association
- belongs_to : user
- belongs_to : category
- belongs_to : brand
- has_many : images


## category テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | NOT NULL    |

### Association テーブル
- has_many : products



## image テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    |string  | NOT NULL    |
| product_id |integer| NOT NULL, foreign_key: true  |

### Association
- belongs_to :product



## brand テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     |string  | NOT NULL    |

### Association
- has_many : products

