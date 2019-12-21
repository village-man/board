class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :board_id
      t.integer :hub_id
      t.text :description
      t.integer :parent_message_id

      t.references :parent_message
      t.timestamps
    end
  end
end
