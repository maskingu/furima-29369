class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  has_many :items
  has_many :orders
  
  with_options presence: true do
    validates :nickname
    EMAIL_REGEX = /@+/.freeze
    validates :email, uniqueness: { case_sensitive: true }, format: { with: EMAIL_REGEX, message: '@を使用してください' }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, confirmation: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両  方を含めて設定してください' }
    F_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
    validates :first_name, :last_name, format: { with: F_NAME_REGEX, message: '全角文字を使用してください' }
    FK_NAME_REGEX = /\A[ァ-ン]+\z/.freeze
    validates :first_name_kana, :last_name_kana, format: { with: FK_NAME_REGEX, message: '全角カナを使用してください' }
    validates :birthday
  end
end
