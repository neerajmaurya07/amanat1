class AddUserReferencesToMehmen < ActiveRecord::Migration[5.0]
  def change
    add_reference :mehmen, :user, foreign_key: true
  end
end
