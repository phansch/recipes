# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesIngredient do
  it { is_expected.to belong_to(:ingredient) }
  it { is_expected.to belong_to(:recipe) }
end
