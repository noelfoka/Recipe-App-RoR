class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[ show edit update destroy ]

  # load_and_authorize_resource
  # rescue_from CanCan::AccessDenied do |_exception|
  #   redirect_to root_path, notice: 'Access denied'
  # end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.where.not(id: RecipeFood.where(recipe_id: @recipe.id).pluck(:food_id))

    @recipe_food = RecipeFood.new
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe = Recipe.find(@recipe_food.recipe_id)

    if @recipe_food.save
      flash[:notice] = 'Ingredient added!'
      # Update the associated food's quantity.
      @recipe_food.food.update_quantity
    else
      flash[:alert] = @recipe_food.errors.full_messages.join(', ')
    end

    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])

    flash[:notice] = if @recipe_food.destroy
                       'Ingredient Removed!'
                     else
                       @recipe_food.errors.full_messages.join(', ')
                     end
    @recipe_food.food.update_quantity
    redirect_to request.referrer
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.update(quantity_param)
      flash[:notice] = 'Ingredient updated!'
      @recipe_food.food.update_quantity
      redirect_to recipe_path(params[:recipe_id])
    else
      flash[:notice] = @recipe_food.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  private
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :recipe_id, :quantity)
  end

  def quantity_param
    params.require(:recipe_food).permit(:quantity)
  end
end
