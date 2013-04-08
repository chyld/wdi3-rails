class AddUserableTypeToUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :subscriber_id
    add_column :users, :userable_id, :integer
    add_column :users, :userable_type, :string
  end
end
