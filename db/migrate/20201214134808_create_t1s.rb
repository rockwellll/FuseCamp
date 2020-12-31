class CreateT1s < ActiveRecord::Migration[6.0]
  def change
    create_table :t1s do |t|

      t.timestamps
    end
  end
end
