# spec/factories/recipe.rb

require 'factory_bot'

FactoryBot.define do
  factory :recipe do
    name { 'Pie' }
    user # This will associate the recipe with a user (assuming you have a User factory)
    preparation_time { '1hr' } # Adjust the preparation time as needed
    cooking_time { '1hr' } # Adjust the cooking time as needed
    description { 'This is a delicious pie recipe.' } # Provide a description
  end
end
