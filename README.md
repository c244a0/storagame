# 作成背景
- 最近ゲームで勝つことが難しくなり、個人的な成長や実力に限界を感じてきたため、ゲームで勝つ以外の楽しみ方を探したいと考えていました。現在のゲームでは、強さを突き詰めていくためにYouTubeやAPIの研究は必須です。
YouTubeやAPIでは強い発信力を持ったプロゲーマーやデッキのトレンドなどがあり、現実と同じく、流行の様なものがありました。
しかし、その影響力により、流行らず埋もれてしまった技術というものがたくさんあると感じていました。
そのため、埋もれた技術を発掘し、共有して研究するアプリを作りたいと感じていました。
- また、自分で戦い方を見つけていくことの楽しさを感じてほしいと考えています。
昨今の戦略ゲームは勝利に固執しがちになってしまうという問題点があると感じています。
例として、先ほど述べたツールを使って流行りの戦略を使用して、どこかで負けが混み、
勝利のみに縛られてしまうということが非常に多いと考えています。
どんなに頑張ったところで、勝利者の割合は増えることはありません。楽しむためのゲームがストレスになってしまうこともあります。
そのため、ゲームの勝利以外の楽しみ方を提案するためのアプリとしての使っていただくことをコンセプトに開発を行いました。

## 使用言語
- Ruby on Rails 6.0.0
- JQuery 3.6.0
- MySQL 5.6.51


### users テーブル

### association
- has_many :posts
- has_many :game_player
- has_many :game, through: :game_players
- has_many :grades, through: :game_players,
- has_many :relationships, foreign_key: :following_id
- has_many :followings, through: :relationships, source: :follower
- has_many :reverse_of_relationships
- has_many :followers, through: :reverse_of_relationships

### games テーブル

### asociation
- has_many :game_player
- has_many :users, through: :game_players
- has_many :grades, through: :game_players
- has_many :posts

### grade テーブル

