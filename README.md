# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email               | string | null: false, unique: true |
| password   | string | null: false |
| nickname            | string | null: false |
| name   | string | null: false |
| name_kana   | string | null: false |
| birth_date   | date | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | references | null: false, foreign_key: true |
| title   | string | null: false |
| category   | string | null: false |
| price   | integer | null: false |
| description   | text | null: false |
| condition   | string | null: false |
| shipping_fee_payer   | string | null: false |
| shipping_origin   | string | null: false |
| processing_time   | string | null: false |

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
| post_code   | integer | null: false |
| prefecture   | strings | null: false |
| city   | strings | null: false |
| building   | strings | null: false |
| phone_number   | integer | null: false |


### Association

- belongs_to :purchase