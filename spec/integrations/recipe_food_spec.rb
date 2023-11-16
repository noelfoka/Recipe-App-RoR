require 'rails_helper'

RSpec.describe 'RecipeFood', type: :feature do
  let(:user) { create(:user, name: 'User One10', email: 'userndse1000@example.com', password: '111111') }
  let(:recipe) { create(:recipe, name: 'Pie') }

  before(:each) do
    # Use FactoryBot-created user and recipe
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'Create New food'
    fill_in 'Name', with: 'Apple'
    fill_in 'Measurement unit', with: 'grams'
    fill_in 'Price', with: '10'
    fill_in 'Quantity', with: '10'
    click_button 'Create Food'
    visit new_recipe_path
    fill_in 'Name', with: recipe.name # Use the same name as the recipe you created above
    fill_in 'Preparation time', with: '1'
    fill_in 'Cooking time', with: '0.5'
    fill_in 'Description', with: 'Apple pie is often served with whipped cream, ice cream, custard or cheddar cheese.'
    click_button 'Create Recipe'
    visit recipes_path
    click_link "Recipe: #{recipe.name}"
    sleep 1
  end

  scenario 'Create/Delete a recipe Food' do
    visit recipes_path
    click_link "Recipe: #{recipe.name}" # Use the recipe variable to access the recipe name
    click_link 'Add Ingredient'
    fill_in 'Quantity', with: '20'
    select 'Apple', from: 'Food'
    click_button 'Create Recipe food'
    visit recipes_path
    click_link "Recipe: #{recipe.name}" # Use the recipe variable to access the recipe name
    assert_text 'Apple'
    assert_text '20'
    assert_text '200.0'
    click_button 'Remove'
    visit recipes_path(recipe) # Use the recipe variable to access the recipe ID
    click_link "Recipe: #{recipe.name}"
    assert_text 'No foods found please create new food'
    sleep 1
  end
end
