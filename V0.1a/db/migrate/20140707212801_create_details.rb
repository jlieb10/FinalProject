class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.text :content
      t.string :procon
      t.belongs_to :apartment, index: true

      t.timestamps
    end
  end
end
