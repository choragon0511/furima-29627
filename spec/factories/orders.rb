FactoryBot.define do
  factory :order do
    token { 'abcd' }
    user_id { 1 }
    item_id { 1 }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '東京' }
    address { '123' }
    building { 'ビル１０１' }
    phone_number { '09011112222' }
  end
end
