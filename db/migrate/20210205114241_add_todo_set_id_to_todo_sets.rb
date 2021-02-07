class AddTodoSetIdToTodoSets < ActiveRecord::Migration[6.0]
  def change
    add_reference :todo_sets, :parent, null: true, foreign_key: {to_table: :todo_sets }
  end
end
