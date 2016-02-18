class CreatePrinces < ActiveRecord::Migration
  def change
    create_table :princes do |t|
      t.float :valueNormal
      t.float :valueAbove

      t.timestamps null: false
    end
  end
end
