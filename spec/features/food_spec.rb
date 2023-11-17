require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  let(:user) { User.create(name: 'Binod', email: 'binod@example.com', password: 'password') }
  let(:food) { Food.create(name: 'tomato', measurement_unit: 'grams', quantity: 1, price: 1.25) }

  before(:each) do
    visit new_user_session_path
    fill_in 'email@example.com', with: user.email
    fill_in 'currentpassword', with: user.password
    click_button 'Log in'
    sleep 1
  end

  scenario 'User views the food list and create food' do
    visit foods_path

    # Expect to see the title
    # expect(page).to have_text('Food', wait: 10)

    # Expect to see table head
    assert_selector 'th', text: 'Name', count: 1
    assert_selector 'th', text: 'Measurement unit', count: 1
    assert_selector 'th', text: 'Unit price', count: 1
    assert_selector 'th', text: 'Actions', count: 1
    click_link 'New food'
    # Expect to see form label
    expect(page).to have_content('Measurement unit')
    expect(page).to have_content('Name')
    expect(page).to have_content('Quantity')
    # Expect to fill form field and create food
    fill_in 'Name', with: 'Apple'
    fill_in 'Measurement unit', with: 'grams'
    fill_in 'Price', with: '1.0'
    click_button 'Create Food'
    expect(page).to have_content('Back to foods')
  end
end
