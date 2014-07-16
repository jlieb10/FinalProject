class AddStatusAndDateToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :move_in_date, :string
    add_column :apartments, :status, :string
  end
end
