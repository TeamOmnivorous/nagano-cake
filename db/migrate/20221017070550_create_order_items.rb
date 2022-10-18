class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.reference :item, foreign_key: true, null: false
      t.references :order, foreign_key: true, null: false
      t.integer :amount, null: false
      t.integer :price, null: false
      t.integer :making_status, null: false

      t.timestamps null: false
    end
  end
end