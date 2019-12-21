class AddDescriptionToHubs < ActiveRecord::Migration[5.2]
  def change
    add_column :hubs, :description, :text
  end
end
