# frozen_string_literal: true

class SlackController < ApplicationController
  def declare
    incident = Incident.create(title: params[:text])

    render json: { response_type: 'in_channel', text: "New incident declared: #{incident.title}" }
  end

  def resolve
    incident = Incident.last
    incident.update(resolved: true)
    return unless incident.present?

    render json: {
      response_type: 'in_channel',
      text: "Incident resolved: #{incident.title}"
    }
  end
end
