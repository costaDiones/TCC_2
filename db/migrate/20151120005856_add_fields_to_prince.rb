class AddFieldsToPrince < ActiveRecord::Migration
  def change
    add_column :princes, :datePrince, :date
  end
end
