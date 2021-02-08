class CreateColors < ActiveRecord::Migration[6.0]
  def change
    create_table :colors do |t|
      t.string :hex, null: false
      t.references :colorable, null: false, polymorphic: true

      t.timestamps
    end
  end
end
