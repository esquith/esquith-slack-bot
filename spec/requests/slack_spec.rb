# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Slacks', type: :request do
  describe 'POST #declare' do
    it 'creates a new incident and then sends a success message in response' do
      post '/slack/declare', params: { text: 'Test incident' }

      expect(response).to have_http_status(:success)
      expect(response.body).to eq({
        response_type: 'in_channel',
        text: 'New incident declared: Test incident'
      }.to_json)
      expect(Incident.last.title).to eq('Test incident')
    end
  end

  describe 'POST #resolve' do
    it 'resolves the incident and sends a success message in response' do
      incident = Incident.create(title: 'Test incident')
      post '/slack/resolve'

      expect(response).to have_http_status(:success)
      expect(response.body).to eq({
        response_type: 'in_channel',
        text: "Incident resolved: #{incident.title}"
      }.to_json)
      expect(incident.reload.resolved?).to eq(true)
    end
  end
end
