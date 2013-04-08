class AddCostToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :cost, :decimal, :default => 0
  end
end
