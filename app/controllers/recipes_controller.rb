class RecipesController < ApplicationController
  # load_and_authorize_resource
  # rescue_from CanCan::AccessDenied do |_exception|
  #   redirect_to root_path, notice: 'Access denied'
  # end
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    if current_user
      @recipes = current_user.recipes.includes(:recipe_foods).order(created_at: :desc)
    else
      redirect_to new_user_session_path, alert: 'Please log in to view your foods.'
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path, Notice: 'Recipes added successfully'
    else
      flash[:notice] = @recipe.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  def public_recipes
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_food = @recipe.recipe_foods
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully deleted.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
