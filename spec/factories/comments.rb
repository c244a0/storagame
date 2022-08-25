FactoryBot.define do
  factory :comment do
    post_id { FactoryBot.create(:post).id }
    user_id { FactoryBot.create(:user).id }
    text { Faker::Lorem.sentence }
  end
end
