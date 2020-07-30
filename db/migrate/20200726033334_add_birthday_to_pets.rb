class AddBirthdayToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :birthday, :date
  end
end
