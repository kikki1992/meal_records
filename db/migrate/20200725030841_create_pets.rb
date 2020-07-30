class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :animals_kind
      t.time :birthday

      t.timestamps
    end
  end
end
