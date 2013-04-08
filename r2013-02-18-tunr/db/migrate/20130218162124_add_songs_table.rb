class AddSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :image
      t.string :filename
      t.integer :album_id
      t.integer :artist_id
      t.timestamps
    end
  end
end
