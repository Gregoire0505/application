class AddCountryIdToTowns < ActiveRecord::Migration[5.2]
  def change
    add_column :towns, :country_id, :integer
  end
end
