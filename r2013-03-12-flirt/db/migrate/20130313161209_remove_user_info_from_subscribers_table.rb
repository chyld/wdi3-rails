class RemoveUserInfoFromSubscribersTable < ActiveRecord::Migration
  def change
    remove_column :subscribers, :username
    remove_column :subscribers, :email
    remove_column :subscribers, :password_digest
  end
end
