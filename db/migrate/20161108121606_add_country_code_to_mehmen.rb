class AddCountryCodeToMehmen < ActiveRecord::Migration[5.0]
  def change
    add_column :mehmen, :country_code, :string
  end
end
