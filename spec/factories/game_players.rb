FactoryBot.define do
  factory :game_player do
    association :user
    association :game
    association :grade
  end
end
