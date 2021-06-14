# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | string | null: false |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_id            | string | null: false |
| item_image         | string | null: false |
| item_name          | string | null: false |
| item_Description   | string | null: false |
| item_category      | string | null: false |
| item_status        | string | null: false |
| burden             | string | null: false |
| area               | string | null: false |
| wait_days          | string | null: false |
| price              | string | null: false |

### Association

- belongs_to :user
- belongs_to :purchase

## purchase テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- belongs_to :shipping_address

## shipping_address テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |

### Association

- belongs_to :purchase