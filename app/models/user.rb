class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :password, format: { with: /[a-z\d]{6,}/i, message: 'is invalid. Include both letters and numbers' }
  
  validates :nickname, presence: :true
  validates :last_name, presence: :true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name, presence: :true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'is invalid. Input full-width characters' }

  validates :last_name_kana, presence: :true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :first_name_kana, presence: :true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :birth_date, presence: :true
end
