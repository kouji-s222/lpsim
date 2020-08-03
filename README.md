# README

## アプリ概要
資金計画シュミレーション アプリ
収入、生活費、住宅関連費用などの入力を行って最後にグラフで収支のバランスがわかるようにしていきます。


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :income
- has_many :spending
- has_many :income_spending

## incomeテーブル
|Column|Type|Options|
|------|----|-------|
|total_income|integer|null: false|
|income_tax|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :users
- has_many :income_spending

## spendingテーブル
|Column|Type|Options|
|------|----|-------|
|expenditure|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :users
- has_many :expense

## expenseテーブル
|Column|Type|Options|
|------|----|-------|
|living|integer|null: false|
|housing|integer|null: false|
|transportation|integer||
|education|integer||
|insurance|integer||
|event|integer||
|spending_id|integer|null: false, foreign_key: true|
### Association
- has_many :users
- has_many :user

## income_spendingテーブル
|Column|Type|Options|
|------|----|-------|
|income_id|integer|null: false, foreign_key: true|
|spending_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :income
- belongs_to :spending
