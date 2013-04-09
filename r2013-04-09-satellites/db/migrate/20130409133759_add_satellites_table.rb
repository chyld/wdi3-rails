class AddSatellitesTable < ActiveRecord::Migration
  def change
    create_table :satellites do |t|
      t.string :name
      t.string :image
      t.float :period
      t.float :diameter
      t.float :distance
      t.timestamps
      t.integer :planet_id
    end
  end
end
