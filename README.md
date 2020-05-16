# README
# みてねApp

## 本番環境URL
https://mitene-app.herokuapp.com/

## テストユーザー
メールアドレス： test@com
パスワード： 111111

# 概要
- ユーザー登録
- 写真の投稿
- コメント機能

# 制作した背景
子供の写真を両親に気軽に共有したいという思いから作成しました。
招待された人のみが閲覧できるクローズドの写真共有アプリです。

子供の成長記録にもななり、コメント機能で会話をすることも可能です。
このアプリをきっかけに家族のコミュニケーションが増えるきっかけを増やしていきたいです。

# 実装予定の内容
- ユーザーの招待機能
- 投稿した日付の月別のカテゴリ分け
- スライドショー表示

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
### Association
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user 



