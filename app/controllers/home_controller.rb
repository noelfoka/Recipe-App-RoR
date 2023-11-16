class HomeController < ApplicationController
  def index
  end

  def shopping_list
    @total_value = 0
    food_types = Food.all.includes(:recipe_foods).order(created_at: :desc)
    food_types.each do |food|
      food.update_quantity
      @total_value += food.quantity * food.price
    end
    @foods = Food.where('quantity != 0')
  end
end
