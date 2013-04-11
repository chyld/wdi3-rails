class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :channel
      t.boolean :is_online
      t.timestamps
    end
  end
end
