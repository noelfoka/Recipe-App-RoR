class CreateRecipesFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes_foods do |t|
      t.string :name
      t.string :measurement_unit
      t.float :price
      t.integer :quantity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
