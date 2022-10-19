class AddColumnDeliveries < ActiveRecord::Migration[6.1]
  def change
    add_column :deliveries, :customer_id, :integer, null: false
    add_column :deliveries, :name, :string, null: false
    add_column :deliveries, :postal_code, :string, null: false
    add_column :deliveries, :address,:string , null: false
  end
end
