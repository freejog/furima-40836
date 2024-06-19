# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday_year_id   | integer | null: false |
| birthday_month_id  | integer | null: false |
| birthday_day_id    | integer | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| item_name     | string     | null: false |
| description   | text       | null: false |
| category_id   | integer    | null: false |
| item_state_id | integer    | null: false |
| charge_id     | integer    | null: false |
| region_id     | integer    | null: false |
| days_id       | integer    | null: false |
| price         | integer    | null: false |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | integer    | null: false |
| prefectures_id | integer    | null: false |
| city           | string     | null: false |
| block          | string     | null: false |
| building       | string     |             |
| phone_number   | integer    | null: false |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order
