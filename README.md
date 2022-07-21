# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nick_name             | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| name                  | string | null: false               |
| name_kana             | string | null: false               |
| birth_date            | date   | null: false               |

- has_many :items
- has_many :purchase_records

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| text             | text       | null: false                    |
| category_id      | text       | null: false                    |
| status           | references | null: false, foreign_key: true |
| postage          | references | null: false, foreign_key: true |
| region           | references | null: false, foreign_key: true |
| shipping_date    | references | null: false, foreign_key: true |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

- has_one :purchase_record
- belongs_to :user

## purchase_records テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one

## shipping_addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| region_id       | references | null: false, foreign_key: true |
| municipalities  | string     | null: false, foreign_key: true |
| address 　　　   | string     | null: false, foreign_key: true |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

- belongs_to :purchase_record