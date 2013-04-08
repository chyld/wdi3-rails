class AddNewAlbumsTable < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :image
      t.timestamps
      t.integer :artist_id
    end
  end
end
