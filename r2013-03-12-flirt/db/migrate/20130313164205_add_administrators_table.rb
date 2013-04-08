class AddAdministratorsTable < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.timestamps
    end
  end
end
