# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false, unique: true |
| encrypted_password | string | null: false |
| lastname     | string | null: false |
| firstname     | string | null: false |
| lastname_kana | string | null: false |
| firstname_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| explain | string | null: false |
| category_id | integer | null: false |
| status_id   | integer | null: false |
| financial_id | integer | null: false |
| area_id   | integer | null: false |
| days   | integer | null: false |
| price   | integer | null: false |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer


## buyers テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| user |  references | null: false, foreign_key: true |
| item |  references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address

## address テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| post_number | intger | null: false |
| prefecture_id | integer | null: false |
| municipality | string | null: false |
| address | intger | null: false |
| building | string |           |
| phone_number | intger | null: false |

### Association

- belongs_to :buyer