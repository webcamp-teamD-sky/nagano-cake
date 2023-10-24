class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'noimage.jpg', content_type: 'image/jpg')
    end
    image
  end

end
