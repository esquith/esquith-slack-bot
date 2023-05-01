# frozen_string_literal: true

class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[declare resolve command]

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

  def command
    text = params[:text]

    if text.start_with?('declare ')
      title = text[8..]
      incident = Incident.create(title:)

      render json: { response_type: 'in_channel', text: "New incident declared: #{incident.title}" }
    elsif text == 'resolve'
      incident = Incident.last
      incident.update(resolved: true)
      return unless incident.present?

      render json: {
        response_type: 'in_channel',
        text: "Incident resolved: #{incident.title}"
      }
    else
      render json: { response_type: 'ephemeral', text: 'Invalid command. Usage: `/rootly declare <title>` or `/rootly resolve`' }
    end
  end
end
