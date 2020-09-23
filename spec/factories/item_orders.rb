FactoryBot.define do
  factory :item_order do
    token { 'xxxxxxxxxxxxxxxxx' }
    postal_code { '123-4567' }
    prefecture { 5 }
    city { '大阪市' }
    house_number { '120-12' }
    building_name { '丸ビル' }
    phone_number { '09012341234'}
  end
end
