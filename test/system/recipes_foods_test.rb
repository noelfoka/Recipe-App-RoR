require 'application_system_test_case'

class RecipesFoodsTest < ApplicationSystemTestCase
  setup do
    @recipes_food = recipes_foods(:one)
  end

  test 'visiting the index' do
    visit recipes_foods_url
    assert_selector 'h1', text: 'Recipes foods'
  end

  test 'should create recipes food' do
    visit recipes_foods_url
    click_on 'New recipes food'

    fill_in 'Measurement unit', with: @recipes_food.measurement_unit
    fill_in 'Name', with: @recipes_food.name
    fill_in 'Price', with: @recipes_food.price
    fill_in 'Quantity', with: @recipes_food.quantity
    click_on 'Create Recipes food'

    assert_text 'Recipes food was successfully created'
    click_on 'Back'
  end

  test 'should update Recipes food' do
    visit recipes_food_url(@recipes_food)
    click_on 'Edit this recipes food', match: :first

    fill_in 'Measurement unit', with: @recipes_food.measurement_unit
    fill_in 'Name', with: @recipes_food.name
    fill_in 'Price', with: @recipes_food.price
    fill_in 'Quantity', with: @recipes_food.quantity
    click_on 'Update Recipes food'

    assert_text 'Recipes food was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Recipes food' do
    visit recipes_food_url(@recipes_food)
    click_on 'Destroy this recipes food', match: :first

    assert_text 'Recipes food was successfully destroyed'
  end
end
