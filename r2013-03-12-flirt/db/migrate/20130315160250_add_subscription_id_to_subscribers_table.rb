class AddSubscriptionIdToSubscribersTable < ActiveRecord::Migration
  def change
    add_column :subscribers, :subscription_id, :integer
  end
end
