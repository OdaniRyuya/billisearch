FactoryBot.define do
  factory :review do
    content { "いい店でした。" }
    association :hall
    association :user
  end
end
