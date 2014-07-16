class AddImageToDetail < ActiveRecord::Migration
  def change
    add_column :details, :image, :string
    add_reference :details, :detail, index: true
  end
end
