class AddProductsTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :image
      t.decimal :cost, :default => 0
      t.float :lat
      t.float :lng
      t.text :address
      t.timestamps
    end
  end
end
