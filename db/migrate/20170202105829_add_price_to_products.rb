class AddPriceToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price, :decimel
  end
end