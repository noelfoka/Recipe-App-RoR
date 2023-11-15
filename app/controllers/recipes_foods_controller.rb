class RecipesFoodsController < ApplicationController
  before_action :set_recipes_food, only: %i[ show edit update destroy ]

  # GET /recipes_foods or /recipes_foods.json
  def index
    @recipes_foods = RecipesFood.all
  end

  # GET /recipes_foods/1 or /recipes_foods/1.json
  def show
  end

  # GET /recipes_foods/new
  def new
    @recipes_food = RecipesFood.new
  end

  # GET /recipes_foods/1/edit
  def edit
  end

  # POST /recipes_foods or /recipes_foods.json
  def create
    @recipes_food = RecipesFood.new(recipes_food_params)

    respond_to do |format|
      if @recipes_food.save
        format.html { redirect_to recipes_food_url(@recipes_food), notice: "Recipes food was successfully created." }
        format.json { render :show, status: :created, location: @recipes_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipes_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes_foods/1 or /recipes_foods/1.json
  def update
    respond_to do |format|
      if @recipes_food.update(recipes_food_params)
        format.html { redirect_to recipes_food_url(@recipes_food), notice: "Recipes food was successfully updated." }
        format.json { render :show, status: :ok, location: @recipes_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipes_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes_foods/1 or /recipes_foods/1.json
  def destroy
    @recipes_food.destroy!

    respond_to do |format|
      format.html { redirect_to recipes_foods_url, notice: "Recipes food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipes_food
      @recipes_food = RecipesFood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipes_food_params
      params.require(:recipes_food).permit(:name, :measurement_unit, :price, :quantity)
    end
end
