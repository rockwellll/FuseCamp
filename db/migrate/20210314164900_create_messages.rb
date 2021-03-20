class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.belongs_to :message_board, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.string :title
      t.text :body
      t.string :status
      t.string :category

      t.timestamps
    end

    add_index :messages, :status
    add_index :messages, :category
  end
end
