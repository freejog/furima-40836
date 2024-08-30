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
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :orders

- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following

- has_many :likes

- has_many :comments

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| item_name     | string     | null: false |
| description   | text       | null: false |
| category_id   | integer    | null: false |
| item_state_id | integer    | null: false |
| charge_id     | integer    | null: false |
| prefecture_id | integer    | null: false |
| day_id        | integer    | null: false |
| price         | integer    | null: false |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

- has_many :likes

- has_many :comments

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
| postcode       | string     | null: false |
| prefecture_id  | integer    | null: false |
| city           | string     | null: false |
| block          | string     | null: false |
| building       | string     |             |
| phone_number   | string     | null: false |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## relationships テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| follower  | references | null: false, foreign_key: true |
| following | references | null: false, foreign_key: true |

### Association

- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"

## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column | Type       | Options                        |
| -----  | ---------- | ------------------------------ |
| text   | text       |                                |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association テーブル

- belongs_to :user
- belongs_to :item