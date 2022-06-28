FactoryBot.define do
  factory :user do
    email                 { |n| "user_test_email_date#{n}@gmail.com" }
    name                  { |n| "user_test_name_date#{n}" }
    password              { "11111111" }
    password_confirmation { "11111111" }
  end
  trait :user_image do
    image { Rack::Test::UploadedFile.new("spec/fixtures/test.jpg") }
  end
end
