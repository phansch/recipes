# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes' do
  describe 'adding a recipe with ingredients', js: true do
    before do
      sign_in FactoryBot.create(:user)
    end
    it 'works' do
      pending 'Need to setup capybara selenium properly See #34'
      visit root_path
      click_link 'New Recipe'
      fill_in 'Title', with: 'A title'
      click_link 'add ingredient'
      fill_in 'Title', with: 'An ingredient'
      sleep 0.5 until page.evaluate_script("tinyMCE.get('recipe_instructions') !== null")
      js = "tinyMCE.get('recipe_instructions').setContent('Text')"
      page.execute_script(js)
      click_button 'Create Recipe'
      expect(page).to have_content 'A title'
    end
  end
end
