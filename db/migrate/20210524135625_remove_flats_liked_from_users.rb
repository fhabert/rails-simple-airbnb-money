class RemoveFlatsLikedFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :flats_liked, :integer, array: true, default: []
  end
end
