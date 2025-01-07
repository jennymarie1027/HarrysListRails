class Post < ApplicationRecord
    belongs_to :user # Add this line to associate a post with a user
end
