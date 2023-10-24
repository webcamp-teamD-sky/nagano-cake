class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  # 上記、エラー吐く可能性あり。
  # エラー吐いた場合上記をコメントアウトすると解決する可能性あり。
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  # def full_name
  #   self.last_name + " " + self.first_name
  # end

  # def full_name_kana
  #   self.last_name_kana + " " + self.first_name_kana
  # end

  validates :last_name, presence: true
  validates :first_name, presence: true
  # validates :last_name_kana, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  # validates :first_name_kana, presence: true
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :phone_number, presence: true
  validates :postcode, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :address, presence: true

end
