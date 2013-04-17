class ChangeColumnsToOrganizations < ActiveRecord::Migration
  def change
  	change_column :organizations, :name, :string, :default => "", :null => false
  	change_column :organizations, :street, :string, :default => "", :null => false
  	change_column :organizations, :city, :string, :default => "", :null => false
  	change_column :organizations, :state, :string, :default => "", :null => false
  	change_column :organizations, :zip, :string, :default => "", :null => false
  	change_column :organizations, :phone, :string, :default => "", :null => false
  	change_column :organizations, :email, :string, :default => "", :null => false
  	change_column :organizations, :contact_name, :string, :default => "", :null => false
  	change_column :organizations, :status, :string, :default => "pending", :null => false
  end
end
