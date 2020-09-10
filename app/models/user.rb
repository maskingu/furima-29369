class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :nickname, presence: true

  validates :email, uniqueness: { case_sensitive: true }, presence: true, format: { with: /@+/, message: '@を使用してください' }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' } do
  end

  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
  end

  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カナを使用してください' } do
  end

  validates :birthday, presence: true
end
