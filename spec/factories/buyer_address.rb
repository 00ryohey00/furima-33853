FactoryBot.define do
  factory :buyer_address do
    postal_code { '123-4567' }
    prefecture_id { 5 }
    city { '東京都' }
    addresses { '1-1' }
    token { 'tok_abcdefghijk00000000000000000' }
    phone_number { 99999999999 }
    association :user
    association :item
  end
end
