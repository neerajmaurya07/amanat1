class ChangeDefaultLevelToMehmen < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :mehmen, :level, default: nil
  end
end
