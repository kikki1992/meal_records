class AddImgsToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :img, :string
  end
end
