class AddNewSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :position
      t.text :filename
      t.timestamps
      t.integer :album_id
    end
  end
end
