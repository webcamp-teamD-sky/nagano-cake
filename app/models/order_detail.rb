class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum production_method: { not_possible: 0, waiting: 1, in_production: 2, production_completed: 3 }
end
