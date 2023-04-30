# frozen_string_literal: true

require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe 'Incidents', type: :request do
  describe 'GET #index' do
    it 'assigns @incidents' do
      incident1 = FactoryBot.create(:incident)
      incident2 = FactoryBot.create(:incident)
      get '/incidents'
      expect(assigns(:incidents)).to match_array([incident1, incident2])
    end

    it 'renders the index template' do
      get '/incidents'
      expect(response).to render_template('index')
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'updates the incident' do
      end
    end

    context 'with invalid attributes' do
      it 'does not update the incident' do
      end
    end
  end
end
