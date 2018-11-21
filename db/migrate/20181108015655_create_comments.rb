class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer "rating"
      t.text "commentaire"

      t.timestamps null: false
    end
  end
end
