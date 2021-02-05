class AddDeletedAtToTodoSets < ActiveRecord::Migration[6.0]
  def change
    add_column :todo_sets, :deleted_at, :datetime, null: true
  end
end
