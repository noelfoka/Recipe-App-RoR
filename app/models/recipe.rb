class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  belongs_to :user
  has_many :foods, through: :recipe_foods
  has_many :recipe_foods
  belongs_to :user
end
