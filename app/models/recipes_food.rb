class RecipesFood < ApplicationRecord
    belongs_to :food
    belongs_to :recipe
end
