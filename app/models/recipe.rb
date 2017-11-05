# frozen_string_literal: true

class Recipe < ApplicationRecord # :nodoc:
  validates :title, presence: true
  validates :instructions, presence: true
end