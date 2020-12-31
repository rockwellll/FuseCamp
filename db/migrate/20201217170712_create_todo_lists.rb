class CreateTodoLists < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_lists do |t|
      t.belongs_to :creator, null: false, foreign_key: { to_table: 'users'}
      t.belongs_to :project, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
