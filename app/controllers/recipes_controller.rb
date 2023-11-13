class RecipesController < ApplicationController

    def index
        @recipe = Recipe.all
    end
end
