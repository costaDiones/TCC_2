class CreateCalleds < ActiveRecord::Migration
  def change
    create_table :calleds do |t|
      t.string :affair
      t.date :datescheduling
      t.string :typecalled
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
