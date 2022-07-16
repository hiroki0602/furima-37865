# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nick_name          | string | null: false               |
| birth_date         | date   | null: false               |

- has_many :items
- has_many :purchase_record

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| image         | text       | null: false                    |
| text          | text       | null: false                    |
| category      | text       | null: false                    |
| state         | text       | null: false                    |
| postage       | text       | null: false                    |
| region        | text       | null: false                    |
| shipping_date | date       | null: false                    |
| user          | references | null: false, foreign_key: true |

- has_many :purchase_record
- belongs_to :user

## purchase_record テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
| price          | text       | null: false                    |
| quantity       | integer    | null: false                    |
| purchase_date  | date       | null: false                    |

- belongs_to :user
- belongs_to :item

## shipping_address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | text       | null: false                    |
| prefecture      | text       | null: false                    |
| municipalities  | text       | null: false                    |
| building_name   | text       |                                |
| phone_number    | text       | null: false                    |

- has_one :shipping_address
- belongs_to :purchase_record