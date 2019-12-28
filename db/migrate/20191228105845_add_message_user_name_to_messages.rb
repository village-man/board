class AddMessageUserNameToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :message_user_name, :string
  end
end
