class ChangeBoardNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :boards, :name, false
  end
end
