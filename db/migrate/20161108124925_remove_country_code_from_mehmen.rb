class RemoveCountryCodeFromMehmen < ActiveRecord::Migration[5.0]
  def change
    remove_column :mehmen, :country_code, :string
  end
end
