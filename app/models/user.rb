class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buyers

  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/.freeze
  validates :password, :password_confirmation, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 2 }
  validates :lastname, :firstname, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :lastname_kana, :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  with_options presence: true do
    validates :birthday
    validates :nickname
    validates :lastname
    validates :firstname
    validates :lastname_kana
    validates :firstname_kana
  end
end
