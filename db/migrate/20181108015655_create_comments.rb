class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string "publication"
      t.string "author"
      t.string "contained"
      t.text "text"

      t.timestamps null: false
    end
  end
end
