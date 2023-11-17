require 'rails_helper'

RSpec.feature 'Recipe', type: :feature do
  let(:user) { User.create(name: 'user', email: 'user@example.com', password: 'password') }

  before(:each) do
    visit new_user_session_path
    fill_in 'email@example.com', with: user.email
    fill_in 'currentpassword', with: user.password
    click_button 'Log in'
  end
  scenario 'User views the recipe details' do
    # Create a recipe for testing (you can adjust the attributes)
    recipe = Recipe.create(name: 'Recipe Name', preparation_time: 30, cooking_time: 60,
                           description: 'Recipe Description', public: true, user: User.first)

    # Create recipe foods for the recipe (you can adjust the attributes)
    recipe.recipe_foods.create(
      quantity: 2,
      food: Food.create(
        name: 'Ingredient Name',
        measurement_unit: 'grams',
        price: 2.99,
        quantity: 100,
        user: User.first
      )
    )

    visit recipe_path(recipe)

    # Verify that the recipe name, description, and other elements are displayed correctly
    expect(page).to have_content('Recipe Name') # Update to match the view
    expect(page).to have_content('60')

    # Verify that the ingredient details are displayed
    expect(page).to have_content('Ingredient Name')
    expect(page).to have_content('2')
    expect(page).to have_content('$5.98')

    # Verify that the "Modify" and "Remove" buttons are present for the ingredient
    expect(page).to have_selector(:link_or_button, 'Modify')
    expect(page).to have_selector(:link_or_button, 'Remove')
  end
end
