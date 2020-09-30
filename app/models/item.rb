class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :status

  with_options presence: true do
    validates :image, :title, :text, :category, :status, :shipping_charge, :shipping_region, :shipping_date
    validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
    validates_inclusion_of :price,  in: 300..9_999_999, message: '指定の範囲内で入力してください'
  end
end
