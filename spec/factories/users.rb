FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    first_name {Gimei.name.first.kanji}
    first_name_kana {Gimei.name.first.katakana}
    last_name {Gimei.name.last.kanji}
    last_name_kana {Gimei.name.last.katakana}
    birthday {Faker::Date.in_date_period}
  end
end