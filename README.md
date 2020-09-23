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
| password          | string  | null: false |
| first_name        | string  | null: false |
| last_name         | string  | null: false |
| first_name_kana   | string  | null: false |
| last_name_kana    | string  | null: false |
| birthday          | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

|  Column            |  Type     | Options                        |
| ------------------ | --------- | ------------------------------ |
| image              | string    | null: false                    |
| title              | string    | null: false                    |
| text               | text      | null: false                    |
| category           | integer   | null: false                    |
| status             | integer   | null: false                    | 
| shipping_charge    | integer   | null: false                    |
| shipping_region    | integer   | null: false                    |
| shipping_date      | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               |references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : order


## orders テーブル

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

|  Column            |  Type      | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## address

|  Column            |  Type      | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order