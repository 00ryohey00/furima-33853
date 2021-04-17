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
- has_many :buyers

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| explain | text | null: false |
| category_id | integer | null: false |
| status_id   | integer | null: false |
| financial_id | integer | null: false |
| prefecture_id   | integer | null: false |
| day_id | integer | null: false |
| price   | integer | null: false |
| user | references | null: false, foreign_key: true |

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
- belongs_to :user

## addresses テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| post_number | string | null: false |
| prefecture_id | integer | null: false |
| municipality | string | null: false |
| address | string | null: false |
| building | string |           |
| phone_number | string | null: false |
| buyer | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer