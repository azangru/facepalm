class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.string :text
      t.string :coordinates

      t.timestamps
    end
  end
end
