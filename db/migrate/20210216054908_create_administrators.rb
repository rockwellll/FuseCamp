class CreateAdministrators < ActiveRecord::Migration[6.1]
  def change
    create_table :administratorships do |t|
      t.belongs_to :account, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true

      t.timestamps
    end

    add_index :administratorships, %i[account_id person_id], unique: true
  end
end
