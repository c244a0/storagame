FactoryBot.define do
  factory :game do
    sequence(:game_title) { |n| "game-{n}"}
  end
end
