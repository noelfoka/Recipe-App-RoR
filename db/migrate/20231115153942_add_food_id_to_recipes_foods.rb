class AddFoodIdToRecipesFoods < ActiveRecord::Migration[7.1]
  def change
    add_reference :recipes_foods, :food, null: false, foreign_key: true
  end
end
