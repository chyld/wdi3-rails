class AddCodesTable < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :url
      t.timestamps
    end
  end
end
