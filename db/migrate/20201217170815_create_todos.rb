class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :todo_list, null: false, foreign_key: true,  on_delete: :cascade
      t.string :name, null: false
      t.boolean :status, default: false
      t.datetime :deadline, null: true
      t.text :notes, null: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
