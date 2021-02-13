class CreatePeoples < ActiveRecord::Migration[6.1]
  def change
    create_table :peoples do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end

    add_index :peoples, %i[company_id user_id project_id], unique: true
  end
end
