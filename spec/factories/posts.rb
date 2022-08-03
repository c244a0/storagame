FactoryBot.define do
  factory :post do
    title { Faker::Name.last_name }
    youtube_url { Faker::Internet.url }
    content { Faker::Lorem.sentence }
    association :user
  end
end
