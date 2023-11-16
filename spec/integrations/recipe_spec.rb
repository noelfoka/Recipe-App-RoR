require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  let(:user) { create(:user, name: 'User One10', email: 'userndse1000@example.com', password: '111111') }
  let(:recipe) { create(:recipe, name: 'Pie') }

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    sleep 1
  end

  scenario 'Create//Delete a Recipe' do
    visit new_recipe_path
    fill_in 'Name', with: 'Pie'
    fill_in 'Preparation time', with: '1'
    fill_in 'Cooking time', with: '0.5'
    fill_in 'Description', with: 'Apple pie is often served with whipped cream, ice cream, custard or cheddar cheese.'
    click_button 'Create Recipe'
    expect(page).to have_content('Recipe: ')
    expect(page).to have_content('Pie')
    expect(page).to have_content('Apple pie is often served with whipped cream, ice cream, custard or cheddar cheese.')
    expect(page).to have_content('Preparation time:')
    expect(page).to have_content('Cooking time:')
    visit recipes_path
    click_button 'REMOVE'
    expect(page).not_to have_content('Description:')
    expect(page).not_to have_content('Recipe:')
    sleep 1
  end
end
