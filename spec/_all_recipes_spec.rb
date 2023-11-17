# spec/features/recipe_feature_spec.rb

require 'rails_helper'

RSpec.feature 'Recipe features', type: :feature do
  let(:recipe) { create(:recipe, name: 'Test Recipe', description: 'Test Description') }

  scenario 'User can remove a recipe' do
    visit recipe_path(recipe)

    # Ensure the page contains the recipe name and description
    expect(page).to have_content('Test Recipe')
    expect(page).to have_content('Test Description')

    # Click the "REMOVE" button and confirm deletion
    expect {
      click_button 'REMOVE'
      page.driver.browser.switch_to.alert.accept
      # Add a sleep if needed to wait for the redirect to happen
      # sleep 1
    }.to change(Recipe, :count).by(-1)

    # Ensure the page no longer contains the deleted recipe content
    expect(page).not_to have_content('Test Recipe')
    expect(page).not_to have_content('Test Description')
  end
end
