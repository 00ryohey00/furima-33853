class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/
  validates :encrypted_password, format: { with: VALID_PASSWORD_REGEX }
  validates :lastname , :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :lastname_kana , :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday , presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end