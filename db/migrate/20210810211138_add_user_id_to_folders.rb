class AddUserIdToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :user_id, :bigint

  end
end
