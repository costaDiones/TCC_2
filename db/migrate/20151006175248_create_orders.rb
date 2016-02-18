class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :affair
      t.string :type
      t.date :daterequest
      t.text :descripition
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
