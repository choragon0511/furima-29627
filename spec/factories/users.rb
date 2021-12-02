FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    first_name {Gimei.name.first.kanji}
    first_name_kana {Gimei.name.first.katakana}
    last_name {Gimei.name.last.kanji}
    last_name_kana {Gimei.name.last.katakana}
    birthday {Faker::Date.in_date_period}
  end
end