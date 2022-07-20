# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nick_name          | string | null: false               |
| name               | string | null: false               |
| birth_date         | date   | null: false               |

- has_many :items
- has_many :purchase_records

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| text             | text       | null: false                    |
| category_id      | text       | null: false                    |
| status_id        | text       | null: false                    |
| postage_id       | text       | null: false                    |
| region_id        | text       | null: false                    |
| shipping_date_id | date       | null: false                    |
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

## shipping_addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture      | text       | null: false                    |
| municipalities  | string     | null: false                    |
| address 　　　   | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

- belongs_to :purchase_record