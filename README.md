# README

# テーブル設計

## users テーブル  (ユーザー情報)

| Column             | Type    | Options                      |
| ------------------ | ------- | ---------------------------- |
| name               | string  | null: false                  |ニックネーム
| email              | string  | null: false unique: true     |メールアドレス
| encrypted_password | string  | null: false                  |パスワード
| first_name         | string  | null: false                  |苗字
| last_name          | string  | null: false                  |名前
| first_name_kana    | string  | null: false                  |苗字（かな）
| last_name_kana     | string  | null: false                  |名前（かな）
| birth_date         |  date   | null: false                  |生年月日


### Association

- has_many :products
- has_many :orders


## products テーブル  (商品情報)

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| item_name     | string     | null: false                   |商品名
| description   |  text      | null: false                   |商品の説明
| category_id   | integer    | null: false                   |カテゴリー
| condition_id  | integer    | null: false                   |商品の状態
| postage_id    | integer    | null: false                   |配送料の負担
| prefecture_id | integer    | null: false                   |配送元の地域(都道府県)
| delivery_id   | integer    | null: false                   |発送日の目安
| price         | integer    | null: false                   |価格
| users         | references | null: false foreign_key: true |出品者のID


### Association

- belongs_to :user
- has_one : order

## orders テーブル  (商品購入情報)

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| users       | references | null: false, foreign_key: true |購入者のID
| products    | references | null: false  foreign_key: true |商品のID

### Association

- belongs_to :user
- belongs_to :product
- has_one :address


## addresses テーブル  (発送先情報)

| Column       | Type     | Options                       |
| ------------ | -------- | ----------------------------- |
| postal_code  | string   | null: false                   |郵便番号
| prefecture_id| integer  | null: false                   |都道府県
| city         | string   | null: false                   |市区町村
| street       | string   | null: false                   |番地
| building     | string   |                               |建物名
| phone_number | string   | null: false                   |電話番号
| orders       |references| null: false  foreign_key: true|購入情報のID

### Association

- belongs_to :order