class Post < ApplicationRecord
    # Add a belongs_to association to the Post model
    belongs_to :user, optional: false
    belongs_to :item
    belongs_to :location, optional: true

    # Add validations to the Post model
    validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :item_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

    scope :user_faves, -> (user) { where(user_id: user.id, is_fave: true) }
    scope :cheap, -> { where("price < 10") }
    scope :expensive, -> { where("price > 100") }
    # scope :search_title_by_keyword, -> (keyword) { where("LOWER(title) LIKE ?", "%#{keyword.downcase}%") } # % === wildcards so that the keyword can be anywhere in the title
    scope :search_desc_by_keyword, -> (keyword) { where("LOWER(description) LIKE ?", "%#{keyword.downcase}%") }
    scope :find_by_user, -> (user) { where(user_id: user.id) }
    scope :recent, -> { where("created_at > ?", 1.week.ago) }
    # scope :alphabetical, -> { order(:title) }

    # before_save :titleize_title
    after_save :log_post_saved

    private
    # def titleize_title
    #     self.title = title.titleize
    # end

    def log_post_saved
        puts "Post was saved!"
        puts self.inspect
        # puts self.title
    end
end
