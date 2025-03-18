class Post < ApplicationRecord
    # Add a belongs_to association to the Post model
    belongs_to :user, optional: false  # Add this line to associate a post with a user

    scope :user_faves, -> (user) { where(user_id: user.id, is_fave: true) }
    scope :cheap, -> { where("price < 10") }
    scope :expensive, -> { where("price > 100") }
    scope :search_title_by_keyword, -> (keyword) { where("title LIKE ?", "%#{keyword}%") }
    scope :search_desc_by_keyword, -> (keyword) { where("description LIKE ?", "%#{keyword}%") }
    scope :find_by_user, -> (user) { where(user_id: user.id) }
    scope :recent, -> { where("created_at > ?", 1.week.ago) }
    scope :alphabetical, -> { order(:title) }
end
