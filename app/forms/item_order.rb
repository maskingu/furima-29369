class ItemOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, numericality: { with: /\A\d{11}\z/, message: '11桁以内の数字を入力してください' }
    validates :city, :house_number, :prefecture
    validates :token

  end
    
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, phone_number: phone_number, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, order_id: order.id)
  end
end