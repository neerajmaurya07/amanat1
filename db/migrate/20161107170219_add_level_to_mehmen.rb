class AddLevelToMehmen < ActiveRecord::Migration[5.0]
  def change
    add_column :mehmen, :level, :integer, default: 0
  end
end
