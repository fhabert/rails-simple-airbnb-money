class AddFlatsLikedToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :flats_liked, :integer, array: true, default: []
  end
end
