class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.timestamps null: false
    end
  end
end