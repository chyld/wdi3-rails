class AddMetadataToSubscribersTable < ActiveRecord::Migration
  def change
    add_column :subscribers, :tagline, :string
    add_column :subscribers, :bio, :string
    add_column :subscribers, :preferences, :string
    add_column :subscribers, :bodytype, :string
    add_column :subscribers, :location, :string
    add_column :subscribers, :status, :string
    add_column :subscribers, :ethnicity, :string
    add_column :subscribers, :gender, :string
    add_column :subscribers, :age, :integer
    add_column :subscribers, :occupation, :string
    add_column :subscribers, :interests, :string
    add_column :subscribers, :political, :string
    add_column :subscribers, :religious, :string
    add_column :subscribers, :education, :string
    add_column :subscribers, :income, :decimal
  end
end
