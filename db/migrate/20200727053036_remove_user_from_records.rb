class RemoveUserFromRecords < ActiveRecord::Migration[5.2]
  def change
    remove_reference :records, :user, foreign_key: true
  end
end
