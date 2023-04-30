# frozen_string_literal: true

class AddResolvedToIncidents < ActiveRecord::Migration[7.0]
  def change
    add_column :incidents, :resolved, :boolean
  end
end
