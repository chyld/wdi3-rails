class AddArtistIdToPaintingsTable < ActiveRecord::Migration
  def change
    add_column :paintings, :artist_id, :integer
  end
end
