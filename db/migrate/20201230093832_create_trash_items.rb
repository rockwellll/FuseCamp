class CreateTrashItems < ActiveRecord::Migration[6.0]
  def change
    create_table :trash_items do |t|
      t.belongs_to :trash, null: false, foreign_key: true
      t.references :trashable, polymorphic: true

      t.timestamps
    end
  end
end
