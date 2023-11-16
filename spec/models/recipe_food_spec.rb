require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }

  it 'is valid with a quantity, a food, and a recipe' do
    food = Food.create(name: 'Ingredient', measurement_unit: 'grams', price: 2.99, quantity: 100, user:)
    recipe = Recipe.create(name: 'Test Recipe', preparation_time: 30, cooking_time: 60, user:)
    recipe_food = RecipeFood.new(quantity: 2, food:, recipe:)
    expect(recipe_food).to be_valid
  end
  it 'is not valid without a quantity' do
    food = Food.create(name: 'Ingredient', measurement_unit: 'grams', price: 2.99, quantity: 100, user:)
    recipe = Recipe.create(name: 'Test Recipe', preparation_time: 30, cooking_time: 60, user:)
    recipe_food = RecipeFood.new(quantity: nil, food:, recipe:)
    expect(recipe_food).to_not be_valid
  end
  it 'is not valid without a food' do
    recipe = Recipe.create(name: 'Test Recipe', preparation_time: 30, cooking_time: 60, user:)
    recipe_food = RecipeFood.new(quantity: 2, food: nil, recipe:)
    expect(recipe_food).to_not be_valid
  end

  it 'is not valid without a recipe' do
    food = Food.create(name: 'Ingredient', measurement_unit: 'grams', price: 2.99, quantity: 100, user:)
    recipe_food = RecipeFood.new(quantity: 2, food:, recipe: nil)
    expect(recipe_food).to_not be_valid
  end
end
