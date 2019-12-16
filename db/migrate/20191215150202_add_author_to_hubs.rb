class AddAuthorToHubs < ActiveRecord::Migration[5.2]
  def change
    add_column :hubs, :author, :string
  end
end
