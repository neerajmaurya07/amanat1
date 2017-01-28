class AddCodeToMehmen < ActiveRecord::Migration[5.0]
  def change
  	add_column :mehmen, :code, :string
    add_index :mehmen, :code
  end
end
