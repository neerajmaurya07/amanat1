class ChangeCodeIndexToMehmen < ActiveRecord::Migration[5.0]
  def change
  	remove_index :mehmen, :code
  	add_index :mehmen, :code, unique: true
  end
end
