require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'quantity, food, recipe should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    recipe = Recipe.new(name: 'Bread', preparation_time: '1.5', cooking_time: '1', user:)
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price: '10', user:)
    recipe_food = RecipeFood.new(quantity: '20', food:, recipe:)
    expect(recipe_food).to be_valid
  end

  it 'quantity should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    recipe = Recipe.new(name: 'Bread', preparation_time: '1.5', cooking_time: '1', user:)
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price: '10', user:)
    recipe_food = RecipeFood.new(food:, recipe:)
    expect(recipe_food).to_not be_valid
  end

  it 'quantity should be positive' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    recipe = Recipe.new(name: 'Bread', preparation_time: '1.5', cooking_time: '1', user:)
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price: '10', user:)
    recipe_food = RecipeFood.new(quantity: '-20', food:, recipe:)
    expect(recipe_food).to_not be_valid
  end

  it 'foodshould be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    recipe = Recipe.new(name: 'Bread', preparation_time: '1.5', cooking_time: '1', user:)
    recipe_food = RecipeFood.new(quantity: '20', recipe:)
    expect(recipe_food).to_not be_valid
  end

  it 'recipe should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price: '10', user:)
    recipe_food = RecipeFood.new(quantity: '20', food:)
    expect(recipe_food).to_not be_valid
  end
end
