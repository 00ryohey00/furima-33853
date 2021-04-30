class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
         VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/.freeze
         validates :password, :password_confirmation, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 2 }
         validates :lastname, :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :lastname_kana, :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday, presence: true
         validates :nickname, presence: true
       

end
