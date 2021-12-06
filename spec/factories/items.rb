FactoryBot.define do
  factory :item do
    name { 'ロボ' }
    description { '金属製' }
    category_id { '2' }
    status_id { '2' }
    burden_id { '2' }
    prefecture_id { '2' }
    wait_day_id { '2' }
    price { '300' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
