class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integar
    add_index :posts, :user_id
  end
end
