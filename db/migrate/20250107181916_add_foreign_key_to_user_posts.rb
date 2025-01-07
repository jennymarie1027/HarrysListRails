class AddForeignKeyToUserPosts < ActiveRecord::Migration[8.0]
  def change
    # First convert the string to integer
    execute 'ALTER TABLE posts ALTER COLUMN user_id TYPE integer USING (user_id::integer)'
    # Then add the foreign key
    add_foreign_key :posts, :users, column: :user_id 
  end
end