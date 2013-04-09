class AddPlanetsTable < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.string :image
      t.timestamps
    end
  end
end
