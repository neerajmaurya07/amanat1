class AddStatusToMehmen < ActiveRecord::Migration[5.0]
  def change
    add_column :mehmen, :status, :integer, default: 0
  end
end
