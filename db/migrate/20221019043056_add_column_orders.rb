class AddColumnOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :customer_id, :integer, null: false
    add_column :orders, :pay_type, :integer, null: false
    add_column :orders, :total_payment, :integer, null: false
    add_column :orders, :order_status, :integer, null: false
    add_column :orders, :name, :integer, :string null: false
    add_column :orders, :postal_code, :string, null: false
    add_column :orders, :address, :string, null: false
    add_column :orders, :postage, :integer, null: false

  end
end
