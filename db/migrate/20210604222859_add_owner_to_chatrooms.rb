class AddOwnerToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :owner, null: false
  end
end
