class AddPrices < ActiveRecord::Migration[7.1]
  def change
    add_column :foods, :price, :decimal
  end
end
