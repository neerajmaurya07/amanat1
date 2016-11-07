class CreateMehmen < ActiveRecord::Migration[5.0]
  def change
    create_table :mehmen do |t|
      t.string :code
      t.string :full_name
      t.string :passport_no
      t.string :country
      t.date :arrival_date
      t.string :arrival_info
      t.date :departure_date
      t.string :departure_info
      t.date :visa_expiry_date

      t.timestamps
    end
  end
end
