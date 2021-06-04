class AddClientToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :client, null: false
  end
end
