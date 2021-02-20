class CreateBoosts < ActiveRecord::Migration[6.0]
  def change
    create_table :boosts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :boostable, null: false, polymorphic: true
      t.text :message, null: false

      t.timestamps
    end

    add_index :boosts, %i[user_id boostable_id boostable_type]
  end
end
