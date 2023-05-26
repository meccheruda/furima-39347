FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"田中"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"タナカ"}
    birth_date            {Faker::Date.between(from: '1950-01-01', to: '2003-12-31')}
  end
end