class User < ApplicationRecord
    # Add a has_many association to the User model
    has_many :posts, dependent: :destroy

    # Add secure password handling
    has_secure_password
  
    # Ensure email is present and unique
    validates :email, presence: true, uniqueness: true
end
