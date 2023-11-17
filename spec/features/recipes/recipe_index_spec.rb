require 'rails_helper'

RSpec.feature 'Recipe', type: :feature do
  let(:user) { User.create(name: 'user', email: 'user@example.com', password: 'password') }

  before(:each) do
    visit new_user_session_path
    fill_in 'email@example.com', with: user.email
    fill_in 'currentpassword', with: user.password
    click_button 'Log in'
    sleep 1
  end
  scenario 'User views the list of recipes' do
    # Create some recipes for testing (you can adjust the attributes)
    Recipe.create(name: 'Recipe 1', preparation_time: 30, cooking_time: 60, description: 'Description 1',
                  public: true, user: User.first)
    Recipe.create(name: 'Recipe 2', preparation_time: 45, cooking_time: 90, description: 'Description 2',
                  public: true, user: User.first)

    # Visit the recipes index page
    visit recipes_path

    # Verify that the recipes are displayed
    expect(page).to have_content('Recipe 1')
    expect(page).to have_content('Recipe 2')

    # Verify that the descriptions are displayed
    expect(page).to have_content('Description 1')
    expect(page).to have_content('Description 2')

    # Verify that the "Delete" buttons are present for each recipe
    expect(page).to have_selector(:link_or_button, 'REMOVE')

    # You can add more assertions and interactions as needed
  end
end
