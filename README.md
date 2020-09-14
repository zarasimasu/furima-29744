## users テーブル
|      Column         | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| fist_name           | string  | null: false |
| family_name_kana    | string  | null: false |
| fist_name_kana      | string  | null: false |
| birthday            | date    | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル
|      Column     | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| product_name    | text       | null: false                    |
| decription      | text       | null: false                    |
| category        | string     | null: false                    |
| status          | integer    | null: false                    |
| cost            | integer    | null: false                    |
| area            | integer    | null: false                    |
| days            | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :orders

## orders テーブル
|         Column           | Type        | Options                        |
| -------------------------| ------------| ------------------------------ |
| item                     | references  | null: false, foreign_key: true |
| user                     | references  | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery

## deliverys テーブル
|      Column              | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| postal_code              | string     | null: false                    |
| prefectures              | integer    | null: false                    |
| municipalities           | string     | null: false                    |
| address                  | string     | null: false                    |
| building                 | string     |                                |
| tel                      | string     | null: false                    |
| card_information         | integer    | null: false                    |
| expiration_date          | integer    | null: false                    |
| security_code            | integer    | null: false                    |
| oder                     | references | null: false, foreign_key: true |



### Association

- belongs_to :oder







