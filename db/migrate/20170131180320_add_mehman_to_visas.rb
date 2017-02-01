class AddMehmanToVisas < ActiveRecord::Migration[5.0]
  def change
    add_reference :visas, :mehman, foreign_key: true
  end
end
