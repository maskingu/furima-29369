class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :status

  validates :image, :title, :text, :category, :status, :shipping_charge, :shipping_region, :shipping_date, presence: true

  H_NUMBER_REGEX = /\A[0-9]+\d/.freeze
  validates :price, presence: true, format: { with: H_NUMBER_REGEX, message: '半角数字を使用してください' } do
  end

end
