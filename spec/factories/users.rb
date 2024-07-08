FactoryBot.define do
  factory :user do
    nickname          { Faker::Name.initials(number: 2) }
    email             { Faker::Internet.email }
    password          { Faker::Alphanumeric.alphanumeric(number: 128, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }

    gimei = Gimei.name
    last_name         { gimei.last.kanji }
    first_name        { gimei.first.kanji }
    last_name_kana    { gimei.last.katakana }
    first_name_kana   { gimei.first.katakana }

    birthday          { Faker::Date.birthday }
  end
end
