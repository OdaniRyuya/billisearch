FactoryBot.define do
  factory :hall do
    name      { "テスト場テスト店" }
    address   { "〇〇県〇〇市〇〇-〇〇番" }
    tel       { "000-0000-0000" }
    email     { "test@example.com" }
    parking   { "20台" }
    price     { "1000円" }
    time      { "14:00~23:00" }
    billiards { "8台" }
    open      { "営業中" }
    url       { "http//test.com" }
    pr        { "よかったら来てください" }
    lead      { "併用施設:ダーツ４台" }
  end
  trait :hall_image do
    image { Rack::Test::UploadedFile.new("spec/fixtures/test.jpg") }
  end
end
