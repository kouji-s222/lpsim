# README

## アプリ概要
資金計画シュミレーション アプリ
収入、生活費、住宅関連費用などの入力を行って最後にグラフで収支のバランスがわかるようにしていきます。

###年収や貯蓄額、生活費などを入力していきます。
<img width="1440" alt="スクリーンショット 2020-08-09 20 17 22" src="https://user-images.githubusercontent.com/66235208/89730907-f4242c80-da7d-11ea-983f-611658745386.png">
<img width="1440" alt="スクリーンショット 2020-08-09 20 18 07" src="https://user-images.githubusercontent.com/66235208/89730910-f71f1d00-da7d-11ea-8037-dc2c4008aea5.png">

##シュミレーションスタートをクリック
<img width="905" alt="スクリーンショット 2020-08-09 20 18 21" src="https://user-images.githubusercontent.com/66235208/89730912-fb4b3a80-da7d-11ea-8732-3fa3a8c4d6de.png">

##シュミレーション結果はグラフでわかりやすく表示します。
<img width="1440" alt="スクリーンショット 2020-08-09 20 18 54" src="https://user-images.githubusercontent.com/66235208/89730914-fdad9480-da7d-11ea-83f4-abbb12669f4a.png">


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
