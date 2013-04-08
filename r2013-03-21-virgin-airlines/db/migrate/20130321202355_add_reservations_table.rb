class AddReservationsTable < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :row
      t.integer :col
      t.integer :flight_id
      t.integer :user_id
      t.timestamps
    end
  end
end
