class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.date :date_reading
      t.float :reading
      t.integer :consumption
      t.integer :month_reference
      t.float :invoiceValue
      t.string :paid
      t.references :hydrometer, index: true, foreign_key: true
      t.references :prince, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
