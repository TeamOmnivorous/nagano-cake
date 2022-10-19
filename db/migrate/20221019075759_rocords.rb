class Rocords < ActiveRecord::Migration[6.1]
  def change
    drop_table :orders
    drop_table :customers
  end
end
