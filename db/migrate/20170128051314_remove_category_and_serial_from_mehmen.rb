class RemoveCategoryAndSerialFromMehmen < ActiveRecord::Migration[5.0]
  def change
  	remove_column :mehmen, :category, :string
  	remove_column :mehmen, :serial, :integer
  end
end
