class Address < ApplicationRecord
  belongs_to :customer
  
  def address_display
    '〒' + postcode + ' ' + address + ' ' + name
  end

  def latest_address_by_customer
    find_by(customer_id: current_customer.id)
  end
end
