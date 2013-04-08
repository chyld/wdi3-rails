class AddCharactersTable < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :symbol
      t.string :hex
      t.integer :code_id
      t.timestamps
    end
  end
end
