# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:instructions) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:ingredients).dependent(:destroy) }

  describe '#owner?' do
    subject { recipe.owner?(user) }

    context 'when recipe has no user' do
      let(:recipe) { FactoryBot.build_stubbed(:recipe, user: user) }
      let(:user) { nil }

      it { is_expected.to be false }
    end

    context 'when recipe has a different user' do
      let(:recipe) { FactoryBot.build_stubbed(:recipe, user: User.new) }
      let(:user) { nil }

      it { is_expected.to be false }
    end

    context 'when recipe has the same user' do
      let(:recipe) { FactoryBot.build_stubbed(:recipe, user: user) }
      let(:user) { FactoryBot.build_stubbed(:user) }

      it { is_expected.to be true }
    end
  end
end
