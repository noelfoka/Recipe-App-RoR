require 'rails_helper'

RSpec.describe Food, type: :model do
  # Create a User record
  let(:user) { User.create(name: 'Binod', email: 'binod@email.com', password: 'password') }
  let(:food) { Food.create(name: 'Apple', measurement_unit: 'grams', price: 0.5, quantity: 0, user:) }

  it 'is valid with valid attributes' do
    expect(food).to be_valid
  end
  it 'is not valid without a name' do
    food = Food.new(measurement_unit: 'grams', price: 0.5, quantity: 10)
    expect(food).not_to be_valid
  end
  it 'is not valid without an associated user' do
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price: 0.5, quantity: 10)
    expect(food).not_to be_valid
  end
  it 'is not valid with a negative price' do
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price: -0.5, quantity: 10, user:)
    expect(food).not_to be_valid
  end
  it 'is not valid with a negative price' do
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price: 0.5, quantity: -10, user:)
    expect(food).not_to be_valid
  end
  it 'is valid with a price of zero' do
    food = Food.new(name: 'Grapes', measurement_unit: 'grams', price: 0, quantity: 100, user:)
    expect(food).to be_valid
  end
  it 'updates quantity based on associated recipe_foods' do
    recipe = Recipe.create(name: 'Delicious Dish', preparation_time: 30, cooking_time: 60, user:)
    food = Food.create(name: 'Apple', measurement_unit: 'grams', price: 0.5, quantity: 1, user:)
    RecipeFood.create(food_id: food.id, recipe_id: recipe.id, quantity: 10)
    food.update_quantity
    expect(food.reload.quantity).to eq(10)
  end
end
