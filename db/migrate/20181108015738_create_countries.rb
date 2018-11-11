class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string "name"
      t.string "description"
      t.integer "number_subscriptions"
      t.string "location"

      t.timestamps null: false
    end
  end
end
