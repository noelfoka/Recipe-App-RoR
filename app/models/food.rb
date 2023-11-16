class Food < ApplicationRecord
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :user
  has_many :recipe_foods

  def update_quantity
    total_quantity = recipe_foods.sum(&:quantity)
    update(quantity: total_quantity)
  end
end
