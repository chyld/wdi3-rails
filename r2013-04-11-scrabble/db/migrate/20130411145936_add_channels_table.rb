class AddChannelsTable < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.timestamps
    end
  end
end
