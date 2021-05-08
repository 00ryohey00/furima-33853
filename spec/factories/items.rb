FactoryBot.define do
  factory :item do
    title                 { 'aaaaaaaa' }
    explain               { 'aaaaaaaaaaaa' }
    category_id              { 2 }
    status_id                { 3 }
    financial_id             { 3 }
    prefecture_id            { 3 }
    day_id                   { 2 }
    price                 { 5000 }
    association :user

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end

end
