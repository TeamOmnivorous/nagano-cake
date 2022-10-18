class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true, null: false
      t.integer :pay_type, null: false
      t.integer :total_payment, null: false
      t.integer :order_status, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :postage, null: false

      t.timestamps null: false
    end
  end
end