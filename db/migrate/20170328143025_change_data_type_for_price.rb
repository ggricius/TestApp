class ChangeDataTypeForPrice < ActiveRecord::Migration[5.0]
  def change
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end
