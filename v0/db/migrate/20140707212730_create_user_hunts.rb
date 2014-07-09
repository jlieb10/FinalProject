class CreateUserHunts < ActiveRecord::Migration
  def change
    create_table :user_hunts do |t|
      t.integer :user_id
      t.integer :hunt_id
    end
  end
end
