# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Amount do
  it { is_expected.to belong_to(:ingredient) }
end
