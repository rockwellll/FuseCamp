class RenameTodoListForeginKeyToToTodoSet < ActiveRecord::Migration[6.0]
  def change
    rename_column :todos, :todo_list_id, :todo_set_id
  end
end
