FactoryBot.define do
  factory :favorite do
    association :hall
    association :user
  end
end
