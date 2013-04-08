class AddExercisesTable < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :activity
      t.float :value
      t.string :unit
      t.date :completed
      t.integer :user_id
      t.timestamps
    end
  end
end
