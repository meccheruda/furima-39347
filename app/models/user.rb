class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, :birth_date, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: 'is invalid. Include both letters and numbers' }
  validates :last_name, :first_name, presence: true,
                                     format: { with: /\A[ぁ-んァ-ン一-龥ー々]+\z/, message: 'Input full-width characters' }
  validates :last_name_kana, :first_name_kana, presence: true,
                                               format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: ' Input full-width katakana characters' }
end
