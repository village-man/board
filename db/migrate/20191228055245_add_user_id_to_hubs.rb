class AddUserIdToHubs < ActiveRecord::Migration[5.2]
  def change
    add_column :hubs, :user_id, :integer
  end
end
