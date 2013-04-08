class AddPrioritiesTable < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :name
      t.string :color, :default => '#ffffff'
      t.integer :user_id
      t.timestamps
    end
  end
end
