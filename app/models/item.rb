class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :status

  validates :image, :title, :text, :category, :status, :shipping_charge, :shipping_region, :shipping_data, :price, presence: true
  
  validates :category_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :shipping_region_id, numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }

end
