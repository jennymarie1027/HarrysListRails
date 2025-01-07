class RenameAuthorIdToUserId < ActiveRecord::Migration[8.0]
  def change
    rename_column :posts, :author_id, :user_id
  end
end
