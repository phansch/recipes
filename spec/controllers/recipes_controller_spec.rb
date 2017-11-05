# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesController do
  let(:valid_attributes) do
    {
      title: 'French Fries',
      instructions: '...',
      work_duration: 2
    }
  end

  let(:invalid_attributes) do
    {
      title: '',
      instructions: '',
      work_duration: 2
    }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      recipe = Recipe.create! valid_attributes
      get :show, params: { id: recipe.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      recipe = Recipe.create! valid_attributes
      get :edit, params: { id: recipe.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Recipe' do
        expect do
          post :create, params: { recipe: valid_attributes }, session: valid_session
        end.to change(Recipe, :count).by(1)
      end

      it 'redirects to the created recipe' do
        post :create, params: { recipe: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Recipe.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { recipe: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          title: 'New title'
        }
      end

      it 'updates the requested recipe' do
        recipe = Recipe.create! valid_attributes
        put :update, params: { id: recipe.to_param, recipe: new_attributes }, session: valid_session
        recipe.reload
        expect(recipe.title).to eq 'New title'
      end

      it 'redirects to the recipe' do
        recipe = Recipe.create! valid_attributes
        put :update,
            params: { id: recipe.to_param, recipe: valid_attributes },
            session: valid_session
        expect(response).to redirect_to(recipe)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        recipe = Recipe.create! valid_attributes
        put :update,
            params: { id: recipe.to_param, recipe: invalid_attributes },
            session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recipe' do
      recipe = Recipe.create! valid_attributes
      expect do
        delete :destroy, params: { id: recipe.to_param }, session: valid_session
      end.to change(Recipe, :count).by(-1)
    end

    it 'redirects to the recipes list' do
      recipe = Recipe.create! valid_attributes
      delete :destroy, params: { id: recipe.to_param }, session: valid_session
      expect(response).to redirect_to(recipes_url)
    end
  end
end
