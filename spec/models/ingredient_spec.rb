# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ingredient do
  it { is_expected.to have_many(:recipes).dependent(:nullify) }
end
