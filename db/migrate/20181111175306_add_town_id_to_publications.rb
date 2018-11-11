class AddTownIdToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :town_id, :integer
  end
end
