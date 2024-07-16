FactoryBot.define do
  factory :order_address do
    postcode       { '123-4567' }
    prefecture_id  { 1 }
    city           { '東京都' }
    block          { '青山1-1' }
    building       { '東京ハイツ' }
    phone_number   { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
