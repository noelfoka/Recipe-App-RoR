class FoodsController < ApplicationController
  # load_and_authorize_resource
  # rescue_from CanCan::AccessDenied do |_exception|
  #   redirect_to root_path, notice: 'Failed to delete this food item because it is being used by other users.'
  # end
  def index
    if current_user
      @foods = current_user.foods.includes(:recipe_foods).order(created_at: :desc)
    else

      redirect_to new_user_session_path, alert: 'Please log in to view your foods.'
    end
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food added successfully'
    else
      render 'new', notice: 'Error adding Food'
    end
  end

  def new
    @food = Food.new
  end

  def destroy
    @food = Food.find(params[:id])
    @food.recipe_foods.destroy_all
    if @food.destroy
      redirect_to foods_path, notice: 'Food deleted successfully'
    else
      redirect_to foods_path, alert: 'Error deleting Food'
    end
  end

  def food_params
    params.require(:food).permit(:name, :quantity, :measurement_unit, :price)
  end
end
