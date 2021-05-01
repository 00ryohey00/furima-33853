FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              {  '1a' + Faker::Internet.password(min_length: 6)  }
    password_confirmation { password }
    lastname            { '漢字カタカナひらがな' }
    firstname           { '漢字カタカナひらがな' }
    lastname_kana { 'カタカナ' }
    firstname_kana           { 'カタカナ' }
    birthday                 { Faker::Date.backward }
  end
end
