# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email               | string | null: false, unique: true |
| encrypted_password   | string | null: false |
| nickname            | string | null: false |
| last_name   | string | null: false |
| first_name   | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana   | string | null: false |
| birth_date   | date | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | references | null: false, foreign_key: true |
| title   | string | null: false |
| description   | text | null: false |
| category_id   | integer | null: false |
| condition_id   | integer | null: false |
| shipping_fee_payer_id   | integer | null: false |
| prefecture_id   | integer | null: false |
| processing_time_id   | integer | null: false |
| price   | integer | null: false |

### Association

- has_one : purchase
- belongs_to :user


## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one :destination
- belongs_to :user
- belongs_to :item


## destinations テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| purchase   | references | null: false, foreign_key: true |
| postal_code   | string | null: false |
| prefecture_id   | integer | null: false |
| city   | string | null: false |
| house_number | string | null: false |
| building_name   | string |  |
| phone_number   | string | null: false |


### Association

- belongs_to :purchase