class ChangeTasksLimitNil < ActiveRecord::Migration[5.2]
  # changecolum
  def up
    change_column :tasks, :name, :string, limit: 30, null: false
  end

  # rollback
  def down
    change_column :tasks, :name, :string, limit: 255, null: true
  end
end
