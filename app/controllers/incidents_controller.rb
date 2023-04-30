# frozen_string_literal: true

class IncidentsController < ApplicationController
  def index
    @incidents = Incident.all
  end
end
