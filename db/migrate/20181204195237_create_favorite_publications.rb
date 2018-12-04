class CreateFavoritePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_publications do |t|
      t.integer :publication_id
      t.integer :user_id

      t.timestamps
    end
  end
end
