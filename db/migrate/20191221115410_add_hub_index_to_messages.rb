class AddHubIndexToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :hub_index, :integer
  end
end
