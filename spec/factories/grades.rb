FactoryBot.define do
  factory :grade do
    sequence(:grades) { |n| "grade-#{n}" }
  end
end
