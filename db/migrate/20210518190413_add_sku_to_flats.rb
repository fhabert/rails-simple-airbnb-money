class AddSkuToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :sku, :string
  end
end
