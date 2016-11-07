class AddIndexToMehmen < ActiveRecord::Migration[5.0]
  def change
    add_index :mehmen, :code, unique: true
    add_index :mehmen, :passport_no, unique: true
  end
end
