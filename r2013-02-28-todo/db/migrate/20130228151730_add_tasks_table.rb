class AddTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :duedate
      t.boolean :is_complete, :default => false
      t.integer :user_id
      t.integer :priority_id
      t.timestamps
    end
  end
end
