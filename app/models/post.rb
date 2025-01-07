class Post < ApplicationRecord
    # Add a belongs_to association to the Post model
    belongs_to :user, optional: false  # Add this line to associate a post with a user
end
