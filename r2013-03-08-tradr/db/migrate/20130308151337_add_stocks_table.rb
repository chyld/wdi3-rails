class AddStocksTable < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.integer :shares
      t.decimal :purchase_price
      t.integer :user_id
      t.timestamps
    end
  end
end
