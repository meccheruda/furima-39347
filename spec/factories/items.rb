FactoryBot.define do
  factory :item do
    item_name            { Faker::Name.initials }
    description          { Faker::Lorem.sentence }
    category_id          { Faker::Number.between(from: 2,to:11) }
    condition_id         { Faker::Number.between(from: 2,to:7) }
    postage_id           { Faker::Number.between(from: 2,to:3) }
    prefecture_id        { Faker::Number.between(from: 2,to:48) }
    delivery_id          { Faker::Number.between(from: 2,to:4) }
    price                { Faker::Number.number(digits: 3) }

    user { FactoryBot.create(:user) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
