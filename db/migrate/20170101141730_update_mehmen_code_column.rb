class UpdateMehmenCodeColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :mehmen, :code, :string
    add_column :mehmen, :category, :string, default: 'english'
    add_column :mehmen, :serial, :integer
  end
end
