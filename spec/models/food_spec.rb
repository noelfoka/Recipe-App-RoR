require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'name, measurement_unit, price, user should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(name: 'Apple', measurement_unit: 'pcs', price: '10', quantity: '1', user:)
    expect(food).to be_valid
  end

  it 'name should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(measurement_unit: 'grams', price: '10', user:)
    expect(food).to_not be_valid
  end

  it 'measurment_unit should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(name: 'Apple', price: '10', user:)
    expect(food).to_not be_valid
  end

  it 'price should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(name: 'Apple', measurement_unit: 'grams', user:)
    expect(food).to_not be_valid
  end

  it 'price should be positive' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price: '-10', user:)
    expect(food).to_not be_valid
  end

  it 'user should be present' do
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price: '10')
    expect(food).to_not be_valid
  end
end
