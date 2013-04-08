class AddMetadataToAdministratorsTable < ActiveRecord::Migration
  def change
    add_column :administrators, :role, :string
    add_column :administrators, :ssn, :string
    add_column :administrators, :tel, :string
  end
end
