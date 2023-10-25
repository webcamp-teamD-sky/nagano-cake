class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    if item && amount
      item.price * amount
    else
      0
    end
  end
end
