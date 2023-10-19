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
end
