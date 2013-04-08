class AddValueFieldToPrioritiesTable < ActiveRecord::Migration
  def change
    add_column :priorities, :value, :integer, :default => 1
  end
end
