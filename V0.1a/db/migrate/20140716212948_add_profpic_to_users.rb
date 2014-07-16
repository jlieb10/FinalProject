class AddProfpicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profpic, :string
  end
end
