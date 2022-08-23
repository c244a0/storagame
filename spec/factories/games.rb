FactoryBot.define do
  factory :game do
    sequence(:game_title) { |_n| 'game-{n}' }
  end
end
