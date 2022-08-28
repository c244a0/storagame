# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ゲーム名のデータ
Game.create(:game_title => 'マリオカート')
Game.create(:game_title => 'ポケモン')
Game.create(:game_title => 'クラッシュロワイヤル')
# 階級のデータ
Grade.create(:grades => '初級')
Grade.create(:grades => '中級')
Grade.create(:grades => '上級')