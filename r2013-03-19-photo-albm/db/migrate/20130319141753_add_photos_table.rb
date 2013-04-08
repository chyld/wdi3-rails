class AddPhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
  end
end
