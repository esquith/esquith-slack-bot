# frozen_string_literal: true

class IncidentsController < ApplicationController
  def index
    @incidents = Incident.all
  end

  def create
    @incident = Incident.new(incident_params)

    if @incident.save
      redirect_to @incident
    else
      render 'new'
    end
  end

  private

  def incident_params
    params.require(:incident).permit(:title, :description, :location)
  end
end
