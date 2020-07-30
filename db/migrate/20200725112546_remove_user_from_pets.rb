class RemoveUserFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pets, :user, foreign_key: true
  end
end
