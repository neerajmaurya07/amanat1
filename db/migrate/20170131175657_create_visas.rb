class CreateVisas < ActiveRecord::Migration[5.0]
  def change
    create_table :visas do |t|
      t.string :file_no
      t.date :submission_date
      t.date :apply_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
