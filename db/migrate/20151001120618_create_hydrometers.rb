class CreateHydrometers < ActiveRecord::Migration
  def change
    create_table :hydrometers do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
