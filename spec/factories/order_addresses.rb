FactoryBot.define do
  factory :order_address do
    postal_code       { '123-4567' }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    city              { '横浜市緑区' }
    street            { '青山1-1-1' }
    building          { '柳ビル203' }
    phone_number      { '09012345678' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
