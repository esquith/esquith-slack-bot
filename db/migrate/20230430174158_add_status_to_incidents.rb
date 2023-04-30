class AddStatusToIncidents < ActiveRecord::Migration[7.0]
  def change
    add_column :incidents, :status, :string
  end
end
