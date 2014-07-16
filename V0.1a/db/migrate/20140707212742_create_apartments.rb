class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string  :street
      t.string  :unit
      t.string  :city
      t.string  :state
      t.string  :zip
      t.string  :link
      t.string  :contact
      t.integer :price
      t.string  :move_in_date
      t.string  :status
      t.belongs_to :hunt, index: true
      t.timestamps
    end
  end
end
