# frozen_string_literal: true

class RecipesIngredient < ApplicationRecord # :nodoc:
  belongs_to :recipe
  belongs_to :ingredient
end
