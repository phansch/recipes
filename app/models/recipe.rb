# frozen_string_literal: true

class Recipe < ApplicationRecord # :nodoc:
  validates :title, presence: true
  validates :instructions, presence: true

  belongs_to :user

  def owner?(user)
    user.present? && user == self.user
  end
end
