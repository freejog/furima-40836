FactoryBot.define do
  factory :item do
    item_name       {Faker::JapaneseMedia::Doraemon.gadget}
    description     {Faker::Lorem.sentence}
    category_id     {Faker::Number.within(range:1..10)}
    item_state_id   {Faker::Number.within(range:1..6)}
    charge_id       {Faker::Number.within(range:1..2)}
    prefecture_id   {Faker::Number.within(range:1..47)}
    day_id          {Faker::Number.within(range:1..3)}
    price           {Faker::Number.within(range:300..9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
