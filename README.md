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

# テーブル設計

## users テーブル
  
| Column            |  Type   | Options     |
| ----------------- | ------- | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false |
| name              | string  | null: false |
| password          | string  | null: false |
| first_name        | string  | null: false |
| last_name         | string  | null: false |
| first_name_kana   | string  | null: false |
| last_name_kana    | string  | null: false |
| birthday_year_id  | integer | null: false |
| birthday_month_id | integer | null: false |
| birthday_day_id   | integer | null: false |

### Association

- has_many :items
- has_many :buys
 
## items テーブル

|  Column            |  Type     | Options                        |
| ------------------ | --------- | ------------------------------ |
| image              | string    | null: false                    |
| title              | string    | null: false                    |
| text               | text      | null: false                    |
| category           | string    | null: false                    |
| status             | string    | null: false                    | 
| shipping_charge    | integer   | null: false                    |
| shipping_region    | string    | null: false                    |
| shippingdata       | string    | null: false                    |
| price              | integer   | null: false                    |
| user               |references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : buys


## buys テーブル

### Association

- belongs_to :item
- has_one : deliveryaddress

|  Column            |  Type      | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## deliveryaddress

|  Column            |  Type      | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postalcode         | integer    | null: false                    |
| region             | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     | null: false                    |
| phone              | integer    | null: false                    |
| buy_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :buy