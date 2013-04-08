class AddGeolocationToTasksTable < ActiveRecord::Migration
  def change
    add_column :tasks, :address, :text
    add_column :tasks, :latitude, :float, :default => 0
    add_column :tasks, :longitude, :float, :default => 0
  end
end
