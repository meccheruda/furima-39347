# README

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |ニックネーム
| email              | string  | null: false unique: true|メールアドレス
| password           | string  | null: false |パスワード
| first_name         | string  | null: false |苗字
| last_name          | string  | null: false |名前
| first_name_kana    | string  | null: false |苗字（かな）
| last_name_kana     | string  | null: false |名前（かな）
| birth_year         | integer | null: false |誕生年
| birth_month        | integer | null: false |誕生月
| birth_day          | integer | null: false |誕生日

### Association

- has_many :products
- has_many :orders
- has_one :address

## products テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| item_name     |  text   | null: false |商品名
| description   |  text   | null: false |商品の説明
| category      | string  | null: false |カテゴリー
| condition     | string  | null: false |商品の状態
| shipping_fee  | string  | null: false |配送料の負担
| origin        | string  | null: false |配送元の地域
| estimated_ship| string  | null: false |発送日の目安
| price         | integer | null: false |価格
| sell_id       | integer | null: false foreign_key: true|出品者のID

### Association

- belongs_to :user
- has_one : address

## orders テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| buyer_id    | integer | null: false, foreign_key: true |購入者のID
| products_id | integer | null: false  foreign_key: true |商品のID

### Association

- belongs_to :user


## addresses テーブル

| Column       | Type    | Options       |
| ------------ | ------- | ------------- |
| postal_code  | string  |  null: false  |郵便番号
| prefecture   | string  |  null: false  |都道府県
| city         | string  |  null: false  |市区町村
| street       | string  |  null: false  |番地
| building     | string  |               |建物名
| phone_number | string  |  null: false  |電話番号

### Association

- belongs_to :user
- belongs_to :products