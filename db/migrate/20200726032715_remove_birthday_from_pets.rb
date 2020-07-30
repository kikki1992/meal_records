class RemoveBirthdayFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :birthday, :time
  end
end
