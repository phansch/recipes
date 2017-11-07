# frozen_string_literal: true

require 'rails_helper'
require 'pundit/rspec'

RSpec.describe RecipePolicy do
  subject { RecipePolicy.new(user, recipe) }

  let(:recipe) { FactoryBot.build_stubbed(:recipe) }

  context 'for a visitor' do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:index) }

    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:create) }

    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:update) }

    it { is_expected.to forbid_action(:destroy) }
  end

  context 'for a default user' do
    let(:user) { FactoryBot.build_stubbed(:user, :default) }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:index) }

    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }

    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:update) }

    it { is_expected.to forbid_action(:destroy) }
  end

  context 'for a recipe owning default user' do
    let(:recipe) { FactoryBot.build_stubbed(:recipe, user: user) }
    let(:user) { FactoryBot.build_stubbed(:user, :default) }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:index) }

    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }

    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:update) }

    it { is_expected.to permit_action(:destroy) }
  end

  context 'for an admin user' do
    let(:user) { FactoryBot.build_stubbed(:user, :admin) }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:index) }

    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }

    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:update) }

    it { is_expected.to permit_action(:destroy) }
  end
end
