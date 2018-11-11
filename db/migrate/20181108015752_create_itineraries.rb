class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string "name"
      t.string "description"
      t.string "activity_place"
      t.time "duration"

      t.timestamps null: false
    end
  end
end
