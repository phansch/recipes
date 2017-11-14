# frozen_string_literal: true

class Ingredient < ApplicationRecord # :nodoc:
  has_many :recipes_ingredients, dependent: :nullify
  has_many :recipes, through: :recipes_ingredients, dependent: :nullify
  has_one :amount, dependent: :destroy

  accepts_nested_attributes_for :amount, reject_if: :all_blank
end
