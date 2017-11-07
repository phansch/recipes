# frozen_string_literal: true

require 'rails_helper'
require 'pundit/rspec'

RSpec.describe ApplicationPolicy do
  subject { ApplicationPolicy.new(user, record) }

  let(:record) { FactoryBot.build_stubbed(:recipe) }


  context 'for a visitor' do
    let(:user) { nil }

    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:index) }

    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:create) }

    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:update) }

    it { is_expected.to forbid_action(:destroy) }
  end

  context 'for a logged in user' do
    let(:user) { FactoryBot.create(:user) }

    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:index) }

    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:create) }

    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:update) }

    it { is_expected.to forbid_action(:destroy) }
  end
end
