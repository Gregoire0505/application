class CreateTowns < ActiveRecord::Migration[5.2]
  def change
    create_table :towns do |t|
      t.string "name"
      t.string "description"
      t.string "location"

      t.timestamps null: false
    end
  end
end
