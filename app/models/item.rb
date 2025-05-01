class Item < ApplicationRecord
    belongs_to :category
    has_many :posts, dependent: :destroy
    has_many :users, through: :posts

    validates :title, presence: true, uniqueness: true
end
