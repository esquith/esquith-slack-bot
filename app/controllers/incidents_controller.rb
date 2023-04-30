# frozen_string_literal: true

class IncidentsController < ApplicationController
  def index
    @incidents = Incident.all
  end

  def show
    @incident = Incident.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @incident }
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Incident not found' }, status: :not_found
  end

  def create
    @incident = Incident.new(incident_params)

    if @incident.save
      redirect_to @incident
    else
      render 'new'
    end
  end

  def update
    @incident = Incident.find(params[:id])

    if @incident.update(incident_params)
      flash[:success] = 'The Incident has been updated successfully'
      redirect_to @incident
    else
      flash.now[:error] = 'There was an error while attempting to update the incident'
      render :edit
    end
  end

  private

  def incident_params
    params.require(:incident).permit(:title, :description, :location)
  end
end
