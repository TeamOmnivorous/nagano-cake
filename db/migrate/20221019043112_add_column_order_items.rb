class AddColumnOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :item_id, :integer, null: false
    add_column :order_items, :order_id, :integer, null: false
    add_column :order_items, :amount, :integer, null: false
    add_column :order_items, :price, :integer, null: false
    add_column :order_items, :making_status, :integer, null: false


  end
end
