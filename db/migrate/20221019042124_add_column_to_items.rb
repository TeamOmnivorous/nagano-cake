class AddColumnToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :genre_id, :integer, :null => false
    add_column :items, :name, :string, :null => false
    add_column :items, :explanation, :text, :null => false
    add_column :items, :tax_out_price, :integer, :null => false
    add_column :items, :is_saled, :boolean, :null => false, default: true#default=>trueかも
  end
end
