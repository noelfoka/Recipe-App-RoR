require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  let(:user) { create(:user, name: 'User Two4', email: 'usertwo4@example.com', password: '111111') }

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    sleep 1
  end

  it 'should create and delete a food' do
    visit new_food_path # Make sure to navigate to the correct page first
    fill_in 'Name', with: 'Apple'
    fill_in 'Measurement unit', with: 'grams'
    fill_in 'Price', with: '10'
    fill_in 'Quantity', with: '10'
    click_button 'Create Food'
    expect(page).to have_content('Apple')
    expect(page).to have_content('grams')
    expect(page).to have_content('10.0')
    click_button 'Delete'
    expect(page).not_to have_content('Apple')
    expect(page).not_to have_content('grams')
    expect(page).not_to have_content('10.0')
    sleep 1
  end
end
