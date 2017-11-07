# frozen_string_literal: true

class Recipe < ApplicationRecord # :nodoc:
  validates :title, presence: true
  validates :instructions, presence: true
  has_many :recipes_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipes_ingredients, dependent: :destroy

  belongs_to :user

  def owner?(user)
    user.present? && user == self.user
  end
end
