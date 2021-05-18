class RemovePricePerNightFromFlats < ActiveRecord::Migration[6.0]
  def change
    remove_column :flats, :price_per_night, :string
  end
end
