FactoryBot.define do
  factory :game_player do
    user_id { 1 }
    game_id { 1 }
    grade_id { 1 }
    association :user
    association :game
    association :grade
  end
end
