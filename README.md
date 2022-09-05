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
 EC2, Route 53, RDS(MariaDB)

## 機能一覧

- ユーザー登録機能(devise)
- 動画投稿機能
- ユーザーゲーム情報登録機能
- フォロー機能(非同期)
- コメント機能(非同期)
- 動画レコメンド機能
- ページネーション機能(kaminari)
- 検索機能

## テスト
### Rspec
- モデル単体テスト
- 結合テスト

## ポートフォリオURL

- http://storagame.com/

## テスト使用のための必要情報

### Basic認証
- ユーザー名: orwell
- パスワード: 1984

### ログインテスト用ユーザー
- Email: test@com
- パスワード: ginger

## 使い方
<img width="443" alt="スクリーンショット 2022-09-05 10 50 09" src="https://user-images.githubusercontent.com/108412889/188344850-05ac422a-fe03-4174-8eb0-0a18e18a4222.png">
- 右上のログインでユーザー管理画面からログインします。
<img width="388" alt="スクリーンショット 2022-09-05 10 47 56" src="https://user-images.githubusercontent.com/108412889/188344675-6e1c66f5-13cc-4fd2-a04b-f377099fa46d.png">

- ハンバーガーメニューから"投稿する"を選択することで動画投稿画面に入ります。
- 投稿画面では、タイトル、youtubeのURL、コンテンツについての解説を記入します。ゲーム名、自分のゲームの階級(自己判断)をセレクトボックスを選びます。
- ゲーム情報登録機能では、自分の階級を入力し、自分と同じ階級の動画を動画一覧画面にレコメンドすることができます。

### 入力用テンプレート(もしお時間がございましたらお願いいたします。)
- タイトル:      テスト投稿
- YoutubeのURL: https://youtu.be/IsXVebXtzwY (こちらは友人に使用許可をいただいております。)
- 解説:         テスト
- ゲーム名:      マリオカート (セレクトボックス)
- 階級:         初級

### ゲーム情報登録画面について
<img width="388" alt="スクリーンショット 2022-09-05 10 47 56" src="https://user-images.githubusercontent.com/108412889/188344655-f31dcb44-8886-4083-94f4-140d0e41b4e1.png">
<img width="267" alt="スクリーンショット 2022-09-05 11 22 38" src="https://user-images.githubusercontent.com/108412889/188348896-d0707679-25a7-4164-9ba7-f0023eaa0ed0.png">
- こちらもハンバーガーメニューを開いていただき"ゲーム情報登録"を選択することで、ゲーム情報登録機能に入ります。
- <img width="1229" alt="スクリーンショット 2022-09-05 11 24 47" src="https://user-images.githubusercontent.com/108412889/188348980-2508ef4b-7427-471c-a063-ac6f4a5ddc96.png">

- テストデータでは、マリオカートのみ登録をしていない状況または初級に登録してある状態であるので、こちらもお時間ありましたらセレクトボタンの変更をして変化を確認いただけると幸いです。

- サイドバーでは、簡単にゲーム名、階級をクリックするとその条件に合わせた動画を呼び出すことができます。

- 動画をクリックしていただくと、動画を視聴する画面に入ります。
- 動画視聴画面では、自分以外のユーザーに対してフォローをかけることができます。
- また、コメントを投稿することができ、投稿ユーザーが削除することも可能です。

- 動画下やや画面上のユーザー名をクリックすると、ユーザーの投稿する動画を一覧で表示する画面に入ります。
- その画面でも、フォローをする、解除をすることができます。

## ER図
- https://drive.google.com/file/d/1l7TDnInYU7jx0YUVqruxtj11oHhRmtr0/view?usp=sharing

## 工夫した点

- 繰り返し処理を用いて、レコメンド機能を行っていく際に、自分なりにSQLの発行を減らすように心がけました。
- 一部機能に非同期処理を行う様にしております。
- エラーがないかを確認し、アプリを担保するため、テストコードを記述しております。
- 中間テーブルに直接外部キーを入力する処理を行っています。


# テーブル

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

## grades テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| grades             | string | null: false              |

## association
- has_many :game_player
- has_many :users, through: :game_players
- has_many :games, through: :game_players
- has_many :posts

## game_players テーブル

| Column             | Type       | Options                                    |
| ------------------ | ---------- | ------------------------------------------ |
| user_id            | references | null: false, foreign_key: true             |
| game_id            | references | null: false, foreign_key: true             |
| grade_id           | references | null: false, foreign_key: true             |

## association

- belong_to :user
- belong_to :game
- belong_to :grade

## comments テーブル

| Column             | Type   | Options                                    |
| ------------------ | ------ | ------------------------------------------ |
| text               | text   | null: false                                |
| user_id            | string | null: false, foreign_key: true             |
| post_id            | string | null: false, foreign_key: true             |

## association

- belongs_to :user
- belongs_to :post

## relationships テーブル

| Column             | Type    | Options                                    |
| ------------------ | ------- | ------------------------------------------ |
| following_id       | integer | null: false                                |
| followed_id        | integer | null: false                                |

## association

- belongs_to :following
- belongs_to :follower

