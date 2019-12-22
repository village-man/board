class AddDeletedTagToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :deleted_tag, :boolean
  end
end
