class ShoppingListsController < ApplicationController
  def index
    @recipe_foods = RecipesFood.group(:food_id).sum(:quantity)
    @foods = Food.all
  end

  def show; end
end
