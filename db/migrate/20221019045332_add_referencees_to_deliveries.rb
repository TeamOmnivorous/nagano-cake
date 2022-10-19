class AddReferenceesToDeliveries < ActiveRecord::Migration[6.1]
  def change
    add_reference :deliveries, :customer, null: false, foreign_key: true
  end
end
