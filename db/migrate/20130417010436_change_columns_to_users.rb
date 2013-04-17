class ChangeColumnsToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :first_name, :string, :default => "", :null => false
  	change_column :users, :last_name, :string, :default => "", :null => false
  	change_column :users, :street, :string, :default => "", :null => false
  	change_column :users, :city, :string, :default => "", :null => false
  	change_column :users, :state, :string, :default => "", :null => false
  	change_column :users, :zip, :string, :default => "", :null => false
  	change_column :users, :phone, :string, :default => "", :null => false
  	change_column :users, :administrator, :booleanm, :default => false, :null => false
  end
end
