class AddWordsTable < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :value
      t.integer :index
      t.integer :declaration_id
      t.timestamps
    end
  end
end
