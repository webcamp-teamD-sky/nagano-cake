class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postcode
      t.string :name
      t.string :address
      t.integer :payment_method
      t.integer :total_payment
      t.integer :status
      t.integer :postage

      t.timestamps
    end
  end
end
