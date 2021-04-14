# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image   | text | null: false |
| text   | string | null: false |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyers


## buyers テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| name | string     | null: false   |
| address | string     | null: false   |

### Association

- belongs_to :items
