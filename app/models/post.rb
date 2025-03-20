class Post < ApplicationRecord
    # Add a belongs_to association to the Post model
    belongs_to :user, optional: false  # Add this line to associate a post with a user

    # Add validations to the Post model
    validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :title, presence: true, length: { minimum: 2 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :category, presence: true
    validates :description, presence: true, length: { minimum: 1 }

    scope :user_faves, -> (user) { where(user_id: user.id, is_fave: true) }
    scope :cheap, -> { where("price < 10") }
    scope :expensive, -> { where("price > 100") }
    scope :search_title_by_keyword, -> (keyword) { where("LOWER(title) LIKE ?", "%#{keyword.downcase}%") } # % === wildcards so that the keyword can be anywhere in the title
    scope :search_desc_by_keyword, -> (keyword) { where("LOWER(description) LIKE ?", "%#{keyword.downcase}%") }
    scope :find_by_user, -> (user) { where(user_id: user.id) }
    scope :recent, -> { where("created_at > ?", 1.week.ago) }
    scope :alphabetical, -> { order(:title) }
end
