FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    title {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    category_id { 2 }
    status_id { 2 }
    shipping_charge_id { 2 }
    shipping_region_id { 2 }
    shipping_date_id { 2 }
    price { 123456 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
