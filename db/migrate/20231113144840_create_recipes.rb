class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :praparation_time
      t.integer :cooking_time
      t.text :description
      t.boolean :public
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
