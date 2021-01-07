class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many:items
  has_many:buys
       
  validates :nickname, presence: true
  validates :password, presence: true, format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i}
  validates :last_name, presence: true, format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true, format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, presence: true, format:{with:/\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, presence: true, format:{with:/\A[ァ-ヶー－]+\z/}
  validates :user_birth_date, presence: true
end
