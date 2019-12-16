class CreateHubs < ActiveRecord::Migration[5.2]
  def change
    create_table :hubs do |t|
      t.string :name
      t.integer :board_id

      t.timestamps
    end
  end
end
