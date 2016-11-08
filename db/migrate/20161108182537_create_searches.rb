class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :country
      t.date :arrival_date_from
      t.date :arrival_date_to
      t.date :visa_expiry_date_from
      t.date :visa_expiry_date_to
      t.integer :status
      t.integer :level

      t.timestamps
    end
  end
end
