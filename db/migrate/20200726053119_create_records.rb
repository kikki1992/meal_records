class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true
      t.string :food_name
      t.integer :food_amount
      t.integer :weight
      t.date :date

      t.timestamps
    end
  end
end
