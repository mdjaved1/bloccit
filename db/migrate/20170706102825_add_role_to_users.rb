class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integar
  end
end
