FactoryBot.define do
  factory :hall do
    sequence(:name)    { |n| "テスト店#{n}" }
    sequence(:address) { |a| "◯◯県◯◯市◯◯-◯◯番#{a}" }
    tel                { "000-0000-0000" }
    email              { "test@example.com" }
    parking            { "20台" }
    price              { "1000円" }
    time               { "14:00~23:00" }
    billiards          { "8台" }
    open               { "営業中" }
    url                { "http//test.com" }
    pr                 { "よかったら来てください" }
    lead               { "併用施設:ダーツ4台" }
  end

  trait :hall_image do
    image { Rack::Test::UploadedFile.new("spec/fixtures/test.jpg") }
  end
end
