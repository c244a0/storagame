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

## 機能一覧

- ユーザー登録機能(devise)
- 動画投稿機能
- ユーザーゲーム情報登録機能
- フォロー機能(非同期)
- コメント機能(非同期)
- 動画レコメンド機能
- ページネーション機能(kaminari)

## テスト
### Rspec
- モデル単体テスト
- 結合テスト

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
- タイトル:      テスト投稿
- YoutubeのURL: https://youtu.be/IsXVebXtzwY (こちらは友人に使用許可をいただいております。)
- 解説:         テスト
- ゲーム名:      マリオカート (セレクトボックス)
- 階級:         初級

- ゲーム情報登録画面について
- こちらもハンバーガーメニューを開いていただき"ゲーム情報登録"を選択することで、ゲーム情報登録機能に入ります。
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
