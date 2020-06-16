class ChangeTasksNameNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tasks, :name, false # NULLを許容しない
  end
end
