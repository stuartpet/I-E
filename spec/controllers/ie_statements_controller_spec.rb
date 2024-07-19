# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IeStatementsController, type: :controller do
  let(:user) { create(:user) }
  let(:ie_statement) { create(:ie_statement, user: user, income: 1000, expenditure: 300) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'creates a new IE statement' do
      expect do
        post :create, params: { ie_statement: { income: 3000, expenditure: 1000 } }
      end.to change(IeStatement, :count).by(1)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: ie_statement.id }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json['rating']).to eql('B')
      expect(json['disposable_income']).to eql('700.0')
    end
  end
end
