# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nick_name             | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| password_confirmation | string | null: false               |
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
| status_id        | references | null: false, foreign_key: true |
| postage_id       | references | null: false, foreign_key: true |
| region_id        | references | null: false, foreign_key: true |
| shipping_date_id | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |

- has_one :purchase_record
- belongs_to :user

## purchase_records テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_id        | references | null: false, foreign_key: true |
| user_id        | references | null: false, foreign_key: true |

- has_one :user
- has_one :item

## shipping_addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| region_id       | references | null: false, foreign_key: true |
| municipalities  | string     | null: false                    |
| address 　　　   | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

- belongs_to :purchase_record