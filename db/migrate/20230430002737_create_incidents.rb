# frozen_string_literal: true

class CreateIncidents < ActiveRecord::Migration[7.0]
  def change
    create_table :incidents do |t|
      t.string :title
      t.string :description
      t.string :severity
      t.string :creator

      t.timestamps
    end
  end
end
