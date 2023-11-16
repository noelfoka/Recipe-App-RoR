require 'test_helper'

class RecipesFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipes_food = recipes_foods(:one)
  end

  test 'should get index' do
    get recipes_foods_url
    assert_response :success
  end

  test 'should get new' do
    get new_recipes_food_url
    assert_response :success
  end

  test 'should create recipes_food' do
    assert_difference('RecipesFood.count') do
      post recipes_foods_url,
           params: { recipes_food: { measurement_unit: @recipes_food.measurement_unit, name: @recipes_food.name,
                                     price: @recipes_food.price, quantity: @recipes_food.quantity } }
    end

    assert_redirected_to recipes_food_url(RecipesFood.last)
  end

  test 'should show recipes_food' do
    get recipes_food_url(@recipes_food)
    assert_response :success
  end

  test 'should get edit' do
    get edit_recipes_food_url(@recipes_food)
    assert_response :success
  end

  test 'should update recipes_food' do
    patch recipes_food_url(@recipes_food),
          params: { recipes_food: { measurement_unit: @recipes_food.measurement_unit, name: @recipes_food.name,
                                    price: @recipes_food.price, quantity: @recipes_food.quantity } }
    assert_redirected_to recipes_food_url(@recipes_food)
  end

  test 'should destroy recipes_food' do
    assert_difference('RecipesFood.count', -1) do
      delete recipes_food_url(@recipes_food)
    end

    assert_redirected_to recipes_foods_url
  end
end
