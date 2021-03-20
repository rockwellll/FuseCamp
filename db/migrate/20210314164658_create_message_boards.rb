class CreateMessageBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :message_boards do |t|
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
