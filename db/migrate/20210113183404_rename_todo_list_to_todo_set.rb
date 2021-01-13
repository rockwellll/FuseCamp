class RenameTodoListToTodoSet < ActiveRecord::Migration[6.0]
  def change
    rename_table :todo_lists, :todo_sets
  end
end
