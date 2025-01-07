class Post < ApplicationRecord
    belongs_to :user, optional: false  # Add this line to associate a post with a user
end
