class AddAlbumsUsersTable < ActiveRecord::Migration
  def change
    create_table :albums_users, :id => false do |t|
      t.integer :album_id
      t.integer :user_id
    end
  end
end
