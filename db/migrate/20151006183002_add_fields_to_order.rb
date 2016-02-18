class AddFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :typerequest, :string
  end
end
