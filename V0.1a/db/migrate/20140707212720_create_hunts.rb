class CreateHunts < ActiveRecord::Migration
  def change
    create_table :hunts do |t|
      t.string :title

      t.timestamps
    end
  end
end
