class ChangeUserIdOnPostsToNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :posts, :user_id, false
  end
end
