# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nick_name             | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| family_name           | string | null: false               |
| first_name            | string | null: false               |
| family_name_kana      | string | null: false               |
| first_name_kana       | string | null: false               |
| birth_date            | date   | null: false               |

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| title            | string     | null: false                    |
| introduction     | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

- has_one :order
- belongs_to :user

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :shipping_address　

## shipping_addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipalities  | string     | null: false                    |
| address 　　　   | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| orders          | references | null: false, foreign_key: true |

- belongs_to :order