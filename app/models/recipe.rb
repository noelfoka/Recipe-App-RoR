class Recipe < ApplicationRecord
    has_many :recipe_food 
    belongs_to :user
end
