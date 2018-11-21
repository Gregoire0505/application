class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string "title"
      t.string "town"
      t.string "publication_type"
      t.text "text"

      t.timestamps null: false
    end
  end
end
