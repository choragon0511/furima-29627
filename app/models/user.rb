class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname, :first_name, :first_name_kana,
            :last_name, :last_name_kana, :birthday, presence: true

  VALID_PASSWORD_REGEX  =  /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX      =  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  VALID_NAME_KANA_REGEX =  /\A[ァ-ヶー]+\z/.freeze

  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }
  validates :first_name, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters' }
  validates :last_name, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters' }
  validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: 'is invalid. Input full-width katakana characters' }
  validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: 'is invalid. Input full-width katakana characters' }
end
