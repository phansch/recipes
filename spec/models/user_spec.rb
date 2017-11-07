# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe '#admin?' do
    it 'returns true if user is admin' do
      expect(User.new(role: :admin).admin?).to be true
    end
  end

  describe '#default' do
    it 'returns true if user is default' do
      expect(User.new(role: :default).default?).to be true
    end
  end
end
