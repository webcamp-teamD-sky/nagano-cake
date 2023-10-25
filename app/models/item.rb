class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :explanation, presence: true, length: { minimum: 1, maximum: 200 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }  # 1円以上
  validates :is_active, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'noimage.jpg', content_type: 'image/jpg')
    end
    image
  end

end
