FactoryBot.define do
  factory :user do
    email                 { |n| "test_date#{n}@gmail.com"}
    name                  { |n| "test_date#{n}"}
    password              {"11111111"}
    password_confirmation {"11111111"}
  end
end
