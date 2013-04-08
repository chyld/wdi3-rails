class AddStoriesTable < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :title
      t.text :url
      t.timestamps
    end
  end
end
