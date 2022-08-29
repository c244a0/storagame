# 作成背景
- 最近ゲームで勝つことが難しくなり、個人的な成長や実力に限界を感じてきたため、ゲームで勝つ以外の楽しみ方を探したいと考えていました。YouTubeでは強い発信力を持ったプロゲーマーやデッキのトレンドなどがあり、流行の様なものがありました。
その影響力により、流行らず埋もれてしまった技術というものがたくさんあると感じていました。
そのため、埋もれた技術を発掘し、共有して研究のためのサービスを作り、ゲームの勝利以外の楽しみ方を提案するためのアプリとしての使っていただくことをコンセプトに開発を行いました。

## 使用言語
- バックエンド
 Ruby on Rails 6.0.0
- フロントエンド
 JQuery 3.6.0
- データベース
 MySQL 5.6.51
- インフラ
 AWS
 EC2,Route 53, RDS(MariaDB)

## ポートフォリオURL

- http://storagame.com/

## テスト使用のための必要情報

- Basic認証
- ユーザー名: orwell
- パスワード: 1984
- テスト用ユーザー
- Email: test@com
- パスワード: ginger

## 使い方
- 右上の新規登録でユーザーを登録します。
- ハンバーガーメニューから"投稿する"を選択することで動画投稿画面に入ります。
- 投稿画面では、タイトル、youtubeのURL、コンテンツについての解説を記入します。ゲーム名、自分のゲームの階級(自己判断)をセレクトボックスを選びます。
- 入力用テンプレート(もしお時間がございましたらお願いいたします。)
- タイトル: テスト投稿
- YoutubeのURL: 
## ER図
- https://drive.google.com/file/d/1l7TDnInYU7jx0YUVqruxtj11oHhRmtr0/view?usp=sharing

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |

## association
- has_many :posts
- has_many :game_player
- has_many :game, through: :game_players
- has_many :grades, through: :game_players,
- has_many :relationships, foreign_key: :following_id
- has_many :followings, through: :relationships, source: :follower
- has_many :reverse_of_relationships
- has_many :followers, through: :reverse_of_relationships

## games テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| game_title         | string | null: false              |

## association
- has_many :game_player
- has_many :users, through: :game_players
- has_many :grades, through: :game_players
- has_many :posts

## grade テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| grades             | string | null: false              |

## association
- has_many :game_player
- has_many :users, through: :game_players
- has_many :games, through: :game_players
- has_many :posts

## game_player テーブル

| Column             | Type       | Options                                    |
| ------------------ | ---------- | ------------------------------------------ |
| user_id            | references | null: false, foreign_key: true             |
| game_id            | references | null: false, foreign_key: true             |
| grade_id           | references | null: false, foreign_key: true             |

## association

- belong_to :user
- belong_to :game
- belong_to :grade

## comment テーブル

| Column             | Type   | Options                                    |
| ------------------ | ------ | ------------------------------------------ |
| text               | text   | null: false                                |
| user_id            | string | null: false, foreign_key: true             |
| post_id            | string | null: false, foreign_key: true             |

## association

- belongs_to :user
- belongs_to :post