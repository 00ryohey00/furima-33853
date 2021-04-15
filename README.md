# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name     | string | null: false |
| name_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| explain | string | null: false |
| category | string | null: false |
| status   | string | null: false |
| financial | string | null: false |
| area   | string | null: false |
| days   | integer | null: false |
| price   | integer | null: false |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer


## buyers テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| name | string     | null: false   |
| address | string     | null: false   |

### Association

- belongs_to :item
