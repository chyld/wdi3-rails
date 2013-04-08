class AddFlightsTable < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :name
      t.string :depart
      t.string :arrive
      t.date :departure
      t.integer :airplane_id
      t.timestamps
    end
  end
end
