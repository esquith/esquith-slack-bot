# frozen_string_literal: true

class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:declare, :resolve]

  def declare
    if params[:challenge]
      render json: { challenge: params[:challenge] }
    else
      incident = Incident.create(title: params[:text])
      render json: { response_type: 'in_channel', text: "New incident declared: #{incident.title}" }
    end
  end

  def resolve
    if params[:challenge]
      render json: { challenge: params[:challenge] }
    else
      incident = Incident.last
      incident.update(resolved: true)
      return unless incident.present?

      render json: {
        response_type: 'in_channel',
        text: "Incident resolved: #{incident.title}"
      }
    end
  end
end
