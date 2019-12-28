class AddUsernameAndAdminflagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, null: false, default: ""
    add_column :users, :admin_flag, :boolean, defalut: nil
  end
end
